import 'package:flutter/material.dart';
import 'package:zyntra/features/home/presentation/widgets/main_section/home_main_content_left.dart';
import 'package:zyntra/features/home/presentation/widgets/main_section/home_main_content_right.dart';

class HomeMainContent extends StatelessWidget {
  const HomeMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 900;

        if (isWideScreen) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: HomeMainContentLeft()),
              const SizedBox(width: 50.0),
              Expanded(flex: 3, child: HomeMainContentRight()),
            ],
          );
        } else {
          return Column(
            children: [
              const HomeMainContentLeft(),
              const SizedBox(height: 40.0),
              const HomeMainContentRight(),
            ],
          );
        }
      },
    );
  }
}
