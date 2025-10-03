import 'package:flutter/material.dart';
import 'package:zyntra/core/widgets/zyntra_logo.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 60.0),
      child: Row(textDirection: TextDirection.rtl, children: [ZyntraLogo()]),
    );
  }
}
