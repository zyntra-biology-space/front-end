import 'package:flutter/material.dart';

class TopicsFilterWidget extends StatefulWidget {
  final List<String> topics;
  final List<int>? initialSelectedIndices;
  final Function(List<String> selectedTopics, List<int> selectedIndices)?
  onTopicsSelected;

  const TopicsFilterWidget({
    super.key,
    required this.topics,
    this.initialSelectedIndices,
    this.onTopicsSelected,
  });

  @override
  State<TopicsFilterWidget> createState() => _TopicsFilterWidgetState();
}

class _TopicsFilterWidgetState extends State<TopicsFilterWidget> {
  Set<int> selectedIndices = {};

  @override
  void initState() {
    super.initState();
    if (widget.initialSelectedIndices != null) {
      selectedIndices = widget.initialSelectedIndices!.toSet();
    }
  }

  void _toggleSelection(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
    });

    if (widget.onTopicsSelected != null) {
      final selectedTopics = selectedIndices
          .map((i) => widget.topics[i])
          .toList();
      widget.onTopicsSelected!(selectedTopics, selectedIndices.toList());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Topics',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              if (selectedIndices.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.4),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${selectedIndices.length} selected',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndices.clear();
                          });
                          if (widget.onTopicsSelected != null) {
                            widget.onTopicsSelected!([], []);
                          }
                        },
                        child: Icon(Icons.close, color: Colors.white, size: 16),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(
              widget.topics.length,
              (index) => _buildTopicChip(widget.topics[index], index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicChip(String name, int index) {
    final isSelected = selectedIndices.contains(index);

    return GestureDetector(
      onTap: () => _toggleSelection(index),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: isSelected ? Colors.white : Colors.white.withOpacity(0.3),
              width: 2,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: isSelected ? Color(0xFF1565C0) : Colors.white,
                  fontSize: 15,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                  letterSpacing: 0.3,
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                Icon(Icons.check_circle, color: Color(0xFF1565C0), size: 18),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
