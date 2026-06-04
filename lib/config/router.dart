import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../helpers/middlewares.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/not_found_screen.dart';
import 'routes.dart';

Page buildPage(BuildContext context, GoRouterState state, Widget child) {
  if (kIsWeb) {
    return NoTransitionPage(child: child);
  }

  return MaterialPage(child: child);
}

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  errorPageBuilder: (context, state) => buildPage(
    context,
    state,
    const NotFoundScreen(),
  ),
  initialLocation: rtLogin,
  routes: [
    GoRoute(
      path: rtLogin,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: LoginScreen());
      },
    ),
    GoRoute(
      path: rtHome,
      redirect: isAuthenticated,
      pageBuilder: (context, state) {
        return const NoTransitionPage(child: HomeScreen());
      },
    ),
  ],
);
