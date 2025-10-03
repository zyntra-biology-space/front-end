import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:zyntra/core/routes/routes.dart';
import 'package:zyntra/core/services/services_locator.dart';

void main() {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) {
    //     return const MyApp();
    //   },
    // ),
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
    );
  }
}
