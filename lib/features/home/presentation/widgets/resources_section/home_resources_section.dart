import 'package:flutter/material.dart';
import 'package:zyntra/core/constants.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/home/presentation/widgets/resources_section/resources_carousel_slider.dart';

class HomeResourcesSection extends StatelessWidget {
  const HomeResourcesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: const ResourcesCarouselSlider(),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: _buildSeeAllButton(context),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildSeeAllButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () {
          // TODO: Implement navigation
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("See All", style: AppStyles.styleSemiBold20(context)),
            const SizedBox(width: 10),
            _buildArrowIcon(),
          ],
        ),
      ),
    );
  }

  Widget _buildArrowIcon() {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 20),
    );
  }
}
