import 'package:flutter/material.dart';
import 'package:zyntra/core/constants.dart';
import 'package:zyntra/core/utils/app_assets.dart';

class WelcomeViewBody extends StatefulWidget {
  const WelcomeViewBody({super.key});

  @override
  State<WelcomeViewBody> createState() => _WelcomeViewBodyState();
}

class _WelcomeViewBodyState extends State<WelcomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: kGradientBackground),
        child: Center(
          child: Image.asset(AppAssets.nasaLogo, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
