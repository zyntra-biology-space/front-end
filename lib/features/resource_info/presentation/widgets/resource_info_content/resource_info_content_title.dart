import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResourceInfoContentTitle extends StatelessWidget {
  const ResourceInfoContentTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Epigenomic regulators elongator complex subunit 2 and methyltransferase 1 differentially condition the spaceflight response in Arabidopsis",
          style: AppStyles.styleSemiBold24(context).copyWith(fontSize: 26),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Text(
              "publisher by : ",
              style: AppStyles.styleSemiBold22(
                context,
              ).copyWith(color: AppColors.secondaryTextColor),
            ),

            SizedBox(width: 8),
            Text(
              "Communications Biology (Nature Portfolio / Springer Nature)",
              style: AppStyles.styleMedium22(context),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Text(
              "date : ",
              style: AppStyles.styleSemiBold22(
                context,
              ).copyWith(color: AppColors.secondaryTextColor),
            ),

            SizedBox(width: 8),
            Text("September 13, 2021", style: AppStyles.styleMedium22(context)),
          ],
        ),
      ],
    );
  }
}
