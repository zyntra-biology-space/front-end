import 'package:flutter/material.dart';
import 'package:zyntra/core/constants.dart';
import 'package:zyntra/core/utils/app_colors.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/home/presentation/widgets/main_section/home_main_section.dart';
import 'package:zyntra/features/home/presentation/widgets/overview_section/home_overview_section.dart';
import 'package:zyntra/features/home/presentation/widgets/resources_section/home_resources_section.dart';
import 'package:zyntra/features/home/presentation/widgets/resources_section/resources_carousel_slider.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kGradientBackground),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: HomeMainSection()),
            const SliverToBoxAdapter(child: HomeResourcesSection()),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: HomeOverviewSection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
