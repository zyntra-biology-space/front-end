import 'package:flutter/material.dart';
import 'package:zyntra/core/data/zyntra_solution.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class HomeOverviewSection extends StatelessWidget {
  const HomeOverviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<ZyntraSolutionPart> zyntraData = zyntraSolution;

    return Column(
      children: [
        const SizedBox(height: 60),
        _buildHeader(context),
        const SizedBox(height: 80),
        ...zyntraData.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return TweenAnimationBuilder(
            duration: Duration(milliseconds: 500 + (index * 150)),
            tween: Tween<double>(begin: 0, end: 1),
            builder: (context, double value, child) {
              return Transform.translate(
                offset: Offset(0, 20 * (1 - value)),
                child: Opacity(opacity: value, child: child),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: _buildSection(context, item, index),
            ),
          );
        }),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          // Main title with gradient
          ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.white, Colors.white],
            ).createShader(bounds),
            child: Text(
              'Zyntra Idea',
              style: AppStyles.styleBold24(
                context,
              ).copyWith(fontSize: 52, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          // Decorative line
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.purple.shade400],
              ),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          // Subtitle
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Text(
              'Explore our curated collection of articles and updates',
              style: AppStyles.styleSemiBold22(
                context,
              ).copyWith(color: AppColors.secondaryTextColor, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    ZyntraSolutionPart item,
    int index,
  ) {
    final colors = [
      [Colors.blue.shade500, Colors.blue.shade700],
      [Colors.purple.shade500, Colors.purple.shade700],
      [Colors.teal.shade500, Colors.teal.shade700],
      [Colors.orange.shade500, Colors.orange.shade700],
    ];

    final colorPair = colors[index % colors.length];
    final isEven = index % 2 == 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1000),
        margin: EdgeInsets.only(left: isEven ? 0 : 40, right: isEven ? 40 : 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Number indicator
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colorPair,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: colorPair[0].withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  // Title with gradient underline
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: AppStyles.styleSemiBold24(context).copyWith(
                          fontSize: 28,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 60,
                        height: 3,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: colorPair),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Description
                  Text(
                    item.description,
                    style: AppStyles.styleRegular20(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
