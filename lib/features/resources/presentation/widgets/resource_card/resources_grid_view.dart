import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/resources/presentation/widgets/resource_card/resource_card.dart';

class ResourcesGridView extends StatelessWidget {
  const ResourcesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual data source
    final resourcesCount = 12;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Text(
            '$resourcesCount items found',
            style: AppStyles.styleSemiBold20(context),
          ),
          // Grid View
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _getCrossAxisCount(context),
              crossAxisSpacing: 24,
              mainAxisSpacing: 0,
              childAspectRatio: 0.65,
            ),
            itemCount: resourcesCount,
            itemBuilder: (context, index) {
              return TweenAnimationBuilder(
                duration: Duration(milliseconds: 400 + (index * 50)),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, double value, child) {
                  return Transform.translate(
                    offset: Offset(0, 30 * (1 - value)),
                    child: Opacity(opacity: value, child: child),
                  );
                },
                child: ResourceCard(
                  onOpenPressed: () {
                    print('Open resource $index');
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1400) return 5;
    if (width > 1000) return 4;
    if (width > 600) return 3;
    return 1;
  }
}
