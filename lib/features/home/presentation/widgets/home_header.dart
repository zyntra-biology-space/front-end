import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/routes/end_points.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int _hoveredIndex = -1;

  final List<_NavItem> _navItems = [
    _NavItem(title: "Resources", icon: Icons.folder_outlined),
    _NavItem(title: "Asky AI", icon: Icons.smart_toy_outlined),
    _NavItem(title: "Home", icon: Icons.library_books_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, right: 60.0, left: 60.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          textDirection: TextDirection.rtl,
          children: [
            // Logo with animation
            Hero(
              tag: 'zyntra_logo',
              child: Image.asset(
                height: 90,
                AppAssets.zyntraLogo,
                fit: BoxFit.contain,
              ),
            ),

            // Navigation tabs with creative design
            Container(
              decoration: BoxDecoration(
                // color: Colors.black.withOpacity(0.3),
                // borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(6),
              child: Row(
                children: List.generate(
                  _navItems.length,
                  (index) => _buildNavTab(context, _navItems[index], index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavTab(BuildContext context, _NavItem item, int index) {
    final isHovered = _hoveredIndex == index;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          _hoveredIndex = index;
        });
      },
      onExit: (_) {
        setState(() {
          _hoveredIndex = -1;
        });
      },
      child: GestureDetector(
        onTap: () {
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
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOutSine,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: isHovered
                ? LinearGradient(
                    colors: [Colors.blue.shade400, Colors.purple.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: isHovered ? null : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                item.icon,
                size: 20,
                color: isHovered ? Colors.white : Colors.white70,
              ),
              const SizedBox(width: 8),
              Text(
                item.title,
                style: AppStyles.styleBold20(context).copyWith(
                  color: isHovered ? Colors.white : Colors.white70,
                  fontWeight: isHovered ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String title;
  final IconData icon;

  _NavItem({required this.title, required this.icon});
}
