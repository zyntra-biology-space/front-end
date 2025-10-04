import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/routes/end_points.dart';
import 'package:zyntra/core/utils/app_assets.dart';
import 'package:zyntra/features/resources/presentation/widgets/resources_header/resources_header_search.dart';

class ResourcesHeaderLogo extends StatelessWidget {
  const ResourcesHeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Wrap search in Expanded to give it flexible width
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: ResourcesHeaderSearch(),
            ),
          ),
          const SizedBox(width: 32),
          // Logo with fixed size
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pushReplacement(EndPoints.homeView);
            },
            child: Image.asset(
              AppAssets.zyntraLogo,
              height: 60,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
