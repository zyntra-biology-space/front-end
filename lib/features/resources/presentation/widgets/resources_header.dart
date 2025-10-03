import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/features/resources/presentation/widgets/resources_header/resources_header_logo.dart';
import 'package:zyntra/features/resources/presentation/widgets/resources_header/resources_header_tabs.dart';

class ResourcesViewHeader extends StatelessWidget {
  const ResourcesViewHeader({super.key});

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
              child: ResourcesHeaderTabs(),
            ),
          ),
          Expanded(flex: 3, child: ResourcesHeaderLogo()),
        ],
      ),
    );
  }
}
