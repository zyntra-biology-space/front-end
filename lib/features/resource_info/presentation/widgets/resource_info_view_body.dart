import 'package:flutter/material.dart';

class ResourceInfoViewBody extends StatefulWidget {
  const ResourceInfoViewBody({super.key});

  @override
  State<ResourceInfoViewBody> createState() => _ResourceInfoViewBodyState();
}

class _ResourceInfoViewBodyState extends State<ResourceInfoViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Resource Info')));
  }
}
