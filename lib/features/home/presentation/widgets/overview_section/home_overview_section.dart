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
        _buildHeader(context),
        const SizedBox(height: 50),
        ...zyntraData.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: _buildSection(context, item.title, item.description),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          'Zyntra Idea',
          style: AppStyles.styleBold24(context).copyWith(fontSize: 40),
        ),
        const SizedBox(height: 8),
        Text(
          'Explore our curated collection of articles and updates',
          style: AppStyles.styleSemiBold22(
            context,
          ).copyWith(color: AppColors.secondaryTextColor),
        ),
      ],
    );
  }

  Widget _buildSection(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyles.styleSemiBold24(
              context,
            ).copyWith(color: AppColors.secondaryTextColor),
          ),
          const SizedBox(height: 8),
          Text(description, style: AppStyles.styleRegular20(context)),
        ],
      ),
    );
  }
}
