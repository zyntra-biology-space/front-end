import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/routes/end_points.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ResourcesInfoCard extends StatelessWidget {
  final VoidCallback? onOpenPressed;
  const ResourcesInfoCard({super.key, this.onOpenPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Main container with content
        Container(
          // width: 240,
          width: double.infinity,
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
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 15.0),
                const SizedBox(height: 20.0),
                // Review button
                OutlinedButton(
                  onPressed: () {
                    GoRouter.of(context).push(EndPoints.resourceInfoView);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(color: Colors.white, width: 2),
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                  child: Text(
                    "REVIEW",
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
          left: 10,
          right: 10,
          child: Container(
            height: 260,
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
