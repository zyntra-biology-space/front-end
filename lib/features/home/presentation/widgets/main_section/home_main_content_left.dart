import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class HomeMainContentLeft extends StatelessWidget {
  const HomeMainContentLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        const SizedBox(height: 20.0),
        _buildDescription(context),
        const SizedBox(height: 30.0),
        _buildGetStartedButton(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    final titleStyle = AppStyles.styleSemiBold24(
      context,
    ).copyWith(fontSize: 60.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Zyntra Biology", style: titleStyle),
        Text("Space", style: titleStyle),
      ],
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Text(
      "A platform that brings together the latest research in space biology to understand the impact of space on life and its applications in human exploration.",
      style: AppStyles.styleSemiBold24(context).copyWith(height: 1.6),
    );
  }

  Widget _buildGetStartedButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
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
            Text("Get Started", style: AppStyles.styleSemiBold22(context)),
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
