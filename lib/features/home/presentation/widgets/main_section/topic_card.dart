import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/home/data/models/topic_data_model.dart';

class TopicCard extends StatefulWidget {
  final TopicData topic;

  const TopicCard({super.key, required this.topic});

  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.25 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: InkWell(
          onTap: () {
            // TODO: Implement topic navigation
            debugPrint('Topic selected: ${widget.topic.title}');
          },
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: AppColors.cardBackground.withOpacity(0.10),
              border: Border.all(color: Colors.white, width: 0.5),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(150),
                  spreadRadius: _isHovered ? 3 : 2,
                  blurRadius: _isHovered ? 8 : 4,
                  offset: Offset(0, _isHovered ? 3 : 1),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.topic.icon, size: 30, color: Colors.white),
                const SizedBox(height: 15),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.topic.title,
                    style: AppStyles.styleMedium16(
                      context,
                    ).copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
