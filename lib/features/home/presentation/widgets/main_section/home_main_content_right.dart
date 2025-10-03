import 'package:flutter/material.dart';
import 'package:zyntra/core/utils/app_styles.dart';
import 'package:zyntra/features/home/data/models/topic_data_model.dart';
import 'package:zyntra/features/home/presentation/widgets/main_section/topic_card.dart';

class HomeMainContentRight extends StatelessWidget {
  const HomeMainContentRight({super.key});

  static const List<TopicData> _topics = [
    TopicData(title: "Space Biology", icon: Icons.biotech_rounded),
    TopicData(title: "Microgravity", icon: Icons.science_rounded),
    TopicData(title: "Radiation", icon: Icons.radar_rounded),
    TopicData(title: "Life Support", icon: Icons.health_and_safety_rounded),
    TopicData(title: "Human Health", icon: Icons.favorite_rounded),
    TopicData(title: "Astrobiology", icon: Icons.eco_rounded),
    TopicData(title: "Genetics", icon: Icons.coronavirus_rounded),
    TopicData(title: "Physiology", icon: Icons.monitor_heart_rounded),
    TopicData(title: "Nutrition", icon: Icons.restaurant_rounded),
    TopicData(title: "Psychology", icon: Icons.psychology_rounded),
    TopicData(title: "Medicine", icon: Icons.medical_services_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildTitle(context),
        const SizedBox(height: 30.0),
        Flexible(child: _buildTopicsGrid(context)),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      "Hi! What topic are you interested in?",
      style: AppStyles.styleBold24(context).copyWith(fontSize: 30.0),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildTopicsGrid(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _calculateCrossAxisCount(screenWidth);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.0,
      ),
      itemCount: _topics.length,
      itemBuilder: (context, index) {
        return TopicCard(topic: _topics[index]);
      },
    );
  }

  int _calculateCrossAxisCount(double screenWidth) {
    if (screenWidth > 1400) return 6;
    if (screenWidth > 1100) return 5;
    if (screenWidth > 800) return 4;
    if (screenWidth > 500) return 3;
    return 1;
  }
}
