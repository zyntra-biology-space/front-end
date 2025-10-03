import 'package:flutter/material.dart';

class ResourcesViewBody extends StatefulWidget {
  const ResourcesViewBody({super.key});

  @override
  State<ResourcesViewBody> createState() => _ResourcesViewBodyState();
}

class _ResourcesViewBodyState extends State<ResourcesViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Resources')));
  }
}
