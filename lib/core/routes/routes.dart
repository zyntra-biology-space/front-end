import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zyntra/core/helpers/page_transition.dart';
import 'package:zyntra/core/routes/end_points.dart';
import 'package:zyntra/features/asky/presentation/views/asky_view.dart';
import 'package:zyntra/features/home/presentation/views/home_view.dart';
import 'package:zyntra/features/home/presentation/widgets/home_view_body.dart';
import 'package:zyntra/features/resource_info/presentation/views/resource_info_view.dart';
import 'package:zyntra/features/resources/presentation/views/resources_view.dart';
import 'package:zyntra/features/welcome/welcome_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: EndPoints.homeView,
    routes: [
      // Welcome Screen Route
      GoRoute(
        path: EndPoints.welcomeView,
        name: 'Welcome',
        pageBuilder: (context, state) => TransitionHelper.createPage(
          key: state.pageKey,
          child: const WelcomeView(),
          // transition: PageTransitions.elasticScale,
          // transition: PageTransitions.slideFromBottom,
          // transition: PageTransitions.rotationScale,
          // transition: PageTransitions.doorSwing,
          transition: PageTransitions.bounceScale,
          duration: const Duration(milliseconds: 500),
        ),
      ),

      // Home Screen Route
      GoRoute(
        path: EndPoints.homeView,
        name: 'Home',
        pageBuilder: (context, state) => TransitionHelper.createPage(
          key: state.pageKey,
          child: const HomeView(),
          // transition: PageTransitions.elasticScale,
          // transition: PageTransitions.slideFromBottom,
          // transition: PageTransitions.rotationScale,
          // transition: PageTransitions.doorSwing,
          transition: PageTransitions.bounceScale,
          duration: const Duration(milliseconds: 500),
        ),
      ),

      // Resources Screen Route
      GoRoute(
        path: EndPoints.resourcesView,
        name: 'Resources',
        pageBuilder: (context, state) => TransitionHelper.createPage(
          key: state.pageKey,
          child: const ResourcesView(),
          // transition: PageTransitions.elasticScale,
          // transition: PageTransitions.slideFromBottom,
          // transition: PageTransitions.rotationScale,
          // transition: PageTransitions.doorSwing,
          transition: PageTransitions.bounceScale,
          duration: const Duration(milliseconds: 500),
        ),
      ),

      // ResourceInfo Screen Route
      GoRoute(
        path: EndPoints.resourceInfoView,
        name: 'Resource Info',
        pageBuilder: (context, state) => TransitionHelper.createPage(
          key: state.pageKey,
          child: const ResourceInfoView(),
          // transition: PageTransitions.elasticScale,
          // transition: PageTransitions.slideFromBottom,
          // transition: PageTransitions.rotationScale,
          // transition: PageTransitions.doorSwing,
          transition: PageTransitions.bounceScale,
          duration: const Duration(milliseconds: 500),
        ),
      ),

      // Asky Screen Route
      GoRoute(
        path: EndPoints.askyView,
        name: 'Asky',
        pageBuilder: (context, state) => TransitionHelper.createPage(
          key: state.pageKey,
          child: const AskyView(),
          // transition: PageTransitions.elasticScale,
          // transition: PageTransitions.slideFromBottom,
          // transition: PageTransitions.rotationScale,
          // transition: PageTransitions.doorSwing,
          transition: PageTransitions.bounceScale,
          duration: const Duration(milliseconds: 500),
        ),
      ),
    ],
  );
}
