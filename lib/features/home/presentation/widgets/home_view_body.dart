import 'package:flutter/material.dart';
import 'package:zyntra/core/constants.dart';
import 'package:zyntra/core/widgets/zyntra_logo.dart';
import 'package:zyntra/features/home/presentation/widgets/main_section/home_main_section.dart';
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
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeMainSection()),
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: const ArticleCarouselSlider(),
            ),
          ),
        ],
      ),
    );
  }
}
