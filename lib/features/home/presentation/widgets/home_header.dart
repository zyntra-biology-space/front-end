import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_assets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 60.0),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Image.asset(height: 90, AppAssets.zyntraLogo, fit: BoxFit.contain),
        ],
      ),
    );
  }
}
