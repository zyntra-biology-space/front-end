import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/features/home/presentation/widgets/home_header.dart';
import 'package:zyntra/features/home/presentation/widgets/main_section/home_main_content.dart';

class HomeMainSection extends StatefulWidget {
  const HomeMainSection({super.key});

  @override
  State<HomeMainSection> createState() => _HomeMainSectionState();
}

class _HomeMainSectionState extends State<HomeMainSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.background3),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const HomeHeader(),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image(
                width: 150,
                image: AssetImage(AppAssets.nasaLogo),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: const HomeMainContent(),
            ),
          ),
        ],
      ),
    );
  }
}
