import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/routes/end_points.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResourceInfoHeaderTabs extends StatefulWidget {
  final int selectedIndex;

  const ResourceInfoHeaderTabs({super.key, this.selectedIndex = 0});

  @override
  State<ResourceInfoHeaderTabs> createState() => _ResourceInfoHeaderTabsState();
}

class _ResourceInfoHeaderTabsState extends State<ResourceInfoHeaderTabs> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  void _goToView(int index) {
    switch (index) {
      case 0:
        GoRouter.of(context).push(EndPoints.resourcesView);
        break;
      case 1:
        GoRouter.of(context).push(EndPoints.askyView);
        break;
      case 2:
        GoRouter.of(context).push(EndPoints.homeView);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {'title': 'All Resources', 'icon': Icons.grid_view_rounded},
      {'title': 'Asky AI', 'icon': Icons.play_circle_rounded},
      {'title': 'Home', 'icon': Icons.description_outlined},
    ];

    return Row(
      children: List.generate(
        tabs.length,
        (index) => HeaderTab(
          title: tabs[index]['title'] as String,
          icon: tabs[index]['icon'] as IconData,
          isSelected: selectedIndex == index,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            _goToView(selectedIndex);
          },
        ),
      ),
    );
  }
}

class HeaderTab extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const HeaderTab({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  icon,
                  key: ValueKey(isSelected),
                  size: 22,
                  color: isSelected ? AppColors.primaryColor : Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: AppStyles.styleSemiBold22(context).copyWith(
                  fontSize: 17,
                  color: isSelected ? AppColors.primaryColor : Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return RotationTransition(turns: animation, child: child);
                },
                child: Icon(
                  isSelected
                      ? Icons.keyboard_arrow_down_rounded
                      : Icons.arrow_forward_ios_rounded,
                  key: ValueKey(isSelected),
                  size: 18,
                  color: isSelected ? AppColors.primaryColor : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
