import 'package:flutter/material.dart';
import 'package:zyntra/core/constants.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/resource_info/presentation/widgets/resource_info_content/resource_info_content.dart';
import 'package:zyntra/features/resource_info/presentation/widgets/resource_info_header.dart';
import 'package:zyntra/features/resource_info/presentation/widgets/resources_info_card/resources_info_card.dart';

class ResourceInfoViewBody extends StatefulWidget {
  const ResourceInfoViewBody({super.key});

  @override
  State<ResourceInfoViewBody> createState() => _ResourceInfoViewBodyState();
}

class _ResourceInfoViewBodyState extends State<ResourceInfoViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Column(children: [ResourcesViewHeader()])),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
              decoration: BoxDecoration(gradient: kGradientBackground),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ResourcesInfoCard(),
                        SizedBox(height: 20),
                        buildMindMapBtn(context),
                      ],
                    ),
                  ),
                  SizedBox(width: 60),
                  Expanded(flex: 4, child: ResourceInfoContent()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMindMapBtn(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 4,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
      onPressed: () {
        // TODO: Implement navigation
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("mind map", style: AppStyles.styleSemiBold22(context)),
          const SizedBox(width: 10),
          _buildArrowIcon(),
        ],
      ),
    );
  }

  Widget _buildArrowIcon() {
    return Container(
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
      ),
      child: Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.primaryColor,
      ),
    );
  }
}
