import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResourceCard extends StatelessWidget {
  final VoidCallback? onOpenPressed;
  const ResourceCard({super.key, this.onOpenPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main container with content
        Container(
          margin: const EdgeInsets.only(top: 80), // Space for overlapping image
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              colors: [Colors.white, AppColors.primaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 140),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15.0),
                // File name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "File Name",
                        style: AppStyles.styleBold24(
                          context,
                        ).copyWith(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Icon(Icons.bookmark_border, color: Colors.white, size: 28),
                  ],
                ),
                SizedBox(height: 8.0),
                // Publisher
                Text(
                  "publisher",
                  style: AppStyles.styleMedium18(context).copyWith(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8.0),
                // Date
                Text(
                  "date / /",
                  style: AppStyles.styleMedium18(context).copyWith(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 20.0),
                // Open button
                OutlinedButton(
                  onPressed: onOpenPressed,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(color: Colors.white, width: 2),
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                  child: Text(
                    "OPEN",
                    style: AppStyles.styleSemiBold18(
                      context,
                    ).copyWith(color: Colors.white, letterSpacing: 1.5),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
        // Overlapping image at top
        Positioned(
          top: 40,
          left: 15,
          right: 15,
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                AppAssets.background1,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
