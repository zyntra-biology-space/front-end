import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

// Main Widget - Topics Display
class ResourceTopicsDisplay extends StatelessWidget {
  final List<String> topics;
  final Color backgroundColor;
  final Color chipColor;
  final Color textColor;

  const ResourceTopicsDisplay({
    super.key,
    required this.topics,
    this.backgroundColor = const Color(0xFF0D47A1),
    this.chipColor = Colors.white,
    this.textColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // Topics Label
          Text(
            'Topics',
            style: AppStyles.styleBold28(context).copyWith(color: chipColor),
          ),
          const SizedBox(width: 20),

          // Topics Chips
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: topics.map((topic) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: TopicChip(
                      label: topic,
                      backgroundColor: chipColor,
                      textColor: textColor,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Topic Chip Widget
class TopicChip extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const TopicChip({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  State<TopicChip> createState() => _TopicChipState();
}

class _TopicChipState extends State<TopicChip> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        widget.label,
        style: AppStyles.styleSemiBold16(
          context,
        ).copyWith(color: widget.textColor),
      ),
    );
  }
}

// Vertical Scrollable Version (Alternative Layout)
class ResourceTopicsVertical extends StatelessWidget {
  final List<String> topics;
  final Color backgroundColor;
  final Color chipColor;
  final Color textColor;

  const ResourceTopicsVertical({
    super.key,
    required this.topics,
    this.backgroundColor = const Color(0xFF0D47A1),
    this.chipColor = Colors.white,
    this.textColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: backgroundColor.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Topics Label
          Text(
            'Topics',
            style: AppStyles.styleBold28(context).copyWith(color: chipColor),
          ),
          const SizedBox(height: 16),

          // Topics Chips Wrap
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: topics.map((topic) {
              return TopicChip(
                label: topic,
                backgroundColor: chipColor,
                textColor: textColor,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// Example Usage:
/*
class ExampleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topics = [
      'Space Biology',
      'Plant Genetics',
      'Epigenomics',
      'Molecular Studies',
      'Research Methods',
      'Space Adaptation',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Horizontal Version (like the image)
              ResourceTopicsDisplay(
                topics: topics,
                backgroundColor: const Color(0xFF0D47A1), // Blue
                chipColor: Colors.white,
                textColor: Colors.black87,
              ),

              const SizedBox(height: 20),

              // Vertical Version (alternative)
              ResourceTopicsVertical(
                topics: topics,
                backgroundColor: const Color(0xFF6A1B9A), // Purple
                chipColor: Colors.white,
                textColor: Colors.black87,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
