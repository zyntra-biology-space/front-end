import 'package:flutter/material.dart';
import 'package:zyntra/core/constants.dart';
import 'package:zyntra/features/resources/presentation/widgets/resource_card/resource_card.dart';
import 'package:zyntra/features/resources/presentation/widgets/resource_card/resources_grid_view.dart';
import 'package:zyntra/features/resources/presentation/widgets/resources_filters_section/resources_filter_section.dart';
import 'package:zyntra/features/resources/presentation/widgets/resources_header.dart';

class ResourcesViewBody extends StatefulWidget {
  const ResourcesViewBody({super.key});

  @override
  State<ResourcesViewBody> createState() => _ResourcesViewBodyState();
}

class _ResourcesViewBodyState extends State<ResourcesViewBody> {
  @override
  Widget build(BuildContext context) {
    final topics = [
      'Technology',
      'Business',
      'Design',
      'Marketing',
      'Finance',
      'Health',
      'Education',
      'Science',
      'Sports',
      'Entertainment',
      'Travel',
      'Food',
      'Lifestyle',
      'News',
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: ResourcesViewHeader()),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(gradient: kGradientBackground),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TopicsFilterWidget(
                          topics: topics,
                          initialSelectedIndices: [],
                          onTopicsSelected: (selectedTopics, selectedIndices) {
                            print('Selected topics: $selectedTopics');
                            print('Selected indices: $selectedIndices');
                          },
                        ),
                      ),
                      // Expanded(child: Text("data")),
                    ],
                  ),
                  SizedBox(height: 10),
                  ResourcesGridView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
