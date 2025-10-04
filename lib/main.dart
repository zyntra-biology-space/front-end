import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zyntra/core/routes/routes.dart';
import 'package:zyntra/core/services/services_locator.dart';
import 'package:zyntra/features/asky/data/cubits/asky_cubit.dart';
import 'package:zyntra/features/asky/data/repos/asky_repo_imp.dart';

void main() {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AskyCubit(askyRepoImp: getIt.get<AskyRepoImp>()),
        ),
      ],
      child: const MyApp(),
    ),
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
