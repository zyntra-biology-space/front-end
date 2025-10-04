import 'package:flutter/material.dart';
import 'package:zyntra/features/resource_info/presentation/widgets/resource_info_content/build_content_section.dart';
import 'package:zyntra/features/resource_info/presentation/widgets/resource_info_content/resource_info_content_title.dart';
import 'package:zyntra/features/resource_info/presentation/widgets/resource_info_content/resource_info_topics.dart';

class ResourceInfoContent extends StatelessWidget {
  const ResourceInfoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResourceTopicsDisplay(
            topics: [
              'Space Biology',
              'Plant Genetics',
              'Epigenomics',
              'Molecular Studies',
              'Research Methods',
              'Space Adaptation',
            ],
          ),
          const SizedBox(height: 32),
          ResourceInfoContentTitle(),
          const SizedBox(height: 32),
          buildContentSection(
            context: context,
            icon: Icons.auto_awesome,
            title: "Summarize",
            content:
                "The research Epigenomic regulators elongator complex subunit 2 and methyltransferase 1 differentially condition the spaceflight response in Arabidopsis (2021, Communications Biology) investigates how plants adapt to the stressful environment of spaceflight at the molecular and epigenomic level.",
            gradient: LinearGradient(
              colors: [
                Colors.purple.withOpacity(0.1),
                Colors.blue.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          const SizedBox(height: 24),
          buildContentSection(
            context: context,
            icon: Icons.stars_rounded,
            title: "Significance",
            content:
                "The research Epigenomic regulators elongator complex subunit 2 and methyltransferase 1 differentially condition the spaceflight response in Arabidopsis (2021, Communications Biology) investigates how plants adapt to the stressful environment of spaceflight at the molecular and epigenomic level.",
            gradient: LinearGradient(
              colors: [
                Colors.amber.withOpacity(0.1),
                Colors.orange.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
