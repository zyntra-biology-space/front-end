import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResourcesHeaderSearch extends StatefulWidget {
  final String? hintText;
  final Function(String)? onSearch;
  final TextEditingController? controller;

  const ResourcesHeaderSearch({
    super.key,
    this.hintText = 'Search anything...',
    this.onSearch,
    this.controller,
  });

  @override
  State<ResourcesHeaderSearch> createState() => _ResourcesHeaderSearchState();
}

class _ResourcesHeaderSearchState extends State<ResourcesHeaderSearch>
    with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: Row(
          children: [
            // Leading search icon with animation
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                child: Icon(
                  Icons.search,
                  color: _isFocused ? Colors.white : Colors.grey.shade600,
                  size: 22,
                ),
              ),
            ),

            // Text field
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: widget.onSearch,
                onTap: () {
                  setState(() {
                    _isFocused = true;
                  });
                  _animationController.forward();
                },
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: AppStyles.styleMedium20(
                    context,
                  ).copyWith(color: AppColors.secondaryTextColor),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                ),
                style: AppStyles.styleMedium20(context),
                onChanged: (value) {
                  // Trigger search on change if needed
                },
              ),
            ),

            // Trailing actions
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _hasText
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Clear button
                        IconButton(
                          onPressed: () {
                            _controller.clear();
                            setState(() {
                              _hasText = false;
                            });
                          },
                          icon: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              size: 16,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        // Search button
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                if (widget.onSearch != null) {
                                  widget.onSearch!(_controller.text);
                                }
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blue.shade400,
                                      Colors.purple.shade400,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Search',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(width: 6),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(width: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage Example
class SearchFieldExample extends StatelessWidget {
  const SearchFieldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ResourcesHeaderSearch(
            hintText: 'Search articles, videos, resources...',
            onSearch: (query) {
              // Handle search logic here
            },
          ),
        ),
      ),
    );
  }
}
