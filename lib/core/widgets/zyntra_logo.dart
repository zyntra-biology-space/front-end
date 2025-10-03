import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';

class ZyntraLogo extends StatelessWidget {
  const ZyntraLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              "Z",
              style: AppStyles.styleBold24(context).copyWith(fontSize: 40),
            ),
            Text(
              "yntra",
              style: AppStyles.styleBold24(context).copyWith(fontSize: 30),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(
              "Biology Space",
              style: AppStyles.styleSemiBold14(context),
            ),
          ),
        ),
      ],
    );
  }
}
