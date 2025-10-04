import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/routes/end_points.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/features/resources/presentation/widgets/resources_header/resources_header_tabs.dart';

class AskyViewHeader extends StatelessWidget {
  const AskyViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 6.0),
      decoration: BoxDecoration(color: AppColors.primaryColor.withOpacity(0.6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: ResourcesHeaderTabs(selectedIndex: 1),
            ),
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).pushReplacement(EndPoints.homeView);
                },
                child: Image.asset(
                  AppAssets.zyntraLogo,
                  height: 60,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
