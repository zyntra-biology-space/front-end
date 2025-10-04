import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class AskyChatAiBubble extends StatelessWidget {
  const AskyChatAiBubble({super.key, this.message = 'message'});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  child: Image(
                    image: AssetImage(AppAssets.nasaLogo),
                    height: 40,
                    width: 40,
                  ),
                ),
                const SizedBox(width: 8.0),
                Text(
                  'Asky',
                  style: AppStyles.styleSemiBold18(
                    context,
                  ).copyWith(color: AppColors.secondaryTextColor),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            MarkdownBody(
              data: message,
              selectable: true,
              shrinkWrap: true,
              fitContent: true,
              styleSheet: MarkdownStyleSheet(
                p: AppStyles.styleRegular20(context),
                listBullet: TextStyle(fontSize: 20),
                strong: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
