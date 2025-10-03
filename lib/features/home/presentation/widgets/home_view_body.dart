import 'package:flutter/material.dart';
import 'package:zyntra/core/constants.dart';
import 'package:zyntra/core/widgets/zyntra_logo.dart';
import 'package:zyntra/features/home/presentation/widgets/main_section/home_main_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [SliverToBoxAdapter(child: HomeMainSection())],
        ),
      ),
    );
  }
}
