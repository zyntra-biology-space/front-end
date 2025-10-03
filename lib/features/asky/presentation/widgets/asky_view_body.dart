import 'package:flutter/material.dart';

class AskyViewBody extends StatefulWidget {
  const AskyViewBody({super.key});

  @override
  State<AskyViewBody> createState() => _AskyViewBodyState();
}

class _AskyViewBodyState extends State<AskyViewBody> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Asky')));
  }
}
