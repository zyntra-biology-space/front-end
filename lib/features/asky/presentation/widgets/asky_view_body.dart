import 'package:flutter/material.dart';
import 'package:zyntra/core/constants.dart';
import 'package:zyntra/core/services/services_locator.dart';
import 'package:zyntra/core/services/storage_data.dart';
import 'package:zyntra/features/asky/presentation/widgets/asky_chat_section/asky_chat_section.dart';
import 'package:zyntra/features/asky/presentation/widgets/asky_resources_section/asky_resources_section.dart';
import 'package:zyntra/features/asky/presentation/widgets/asky_view_header.dart';

class AskyViewBody extends StatefulWidget {
  const AskyViewBody({super.key});

  @override
  State<AskyViewBody> createState() => _AskyViewBodyState();
}

class _AskyViewBodyState extends State<AskyViewBody> {
  @override
  Widget build(BuildContext context) {
    final resources = getIt<StorageData>().resources;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Column(children: [AskyViewHeader()])),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
              decoration: BoxDecoration(gradient: kGradientBackground),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: AskyResourcesSection(resources: resources ?? []),
                  ),
                  SizedBox(width: 30),
                  Expanded(flex: 3, child: AskyChatSection()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
