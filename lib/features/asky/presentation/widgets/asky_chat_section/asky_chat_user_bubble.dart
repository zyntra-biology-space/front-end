import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class AskyChatUserBubble extends StatelessWidget {
  const AskyChatUserBubble({super.key, this.message = 'message'});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      constraints: const BoxConstraints(maxWidth: 300),
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFD3D4F2).withOpacity(0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(AppAssets.avatar),
              ),
              const SizedBox(width: 8.0),
              Text(
                'You',
                style: AppStyles.styleSemiBold18(
                  context,
                ).copyWith(color: AppColors.secondaryTextColor),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            message,
            style: AppStyles.styleRegular22(
              context,
            ).copyWith(color: AppColors.primaryTextColor),
          ),
        ],
      ),
    );
  }
}
