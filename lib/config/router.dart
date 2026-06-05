import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../api/models/product_model.dart';
import '../helpers/middlewares.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/not_found_screen.dart';
import '../screens/product_add_screen.dart';
import '../screens/product_delete_screen.dart';
import '../screens/product_edit_screen.dart';
import '../screens/product_list_screen.dart';
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
    GoRoute(
      path: rtProductList,
      redirect: isAuthenticated,
      pageBuilder: (context, state) => buildPage(
        context,
        state,
        const ProductListScreen(),
      ),
    ),
    GoRoute(
      path: rtProductAdd,
      redirect: isAuthenticated,
      pageBuilder: (context, state) => buildPage(
        context,
        state,
        const ProductAddScreen(),
      ),
    ),
    GoRoute(
      path: rtProductEdit,
      redirect: isAuthenticated,
      pageBuilder: (context, state) {
        final product = state.extra as Product;
        return buildPage(
          context,
          state,
          ProductEditScreen(product: product),
        );
      },
    ),
    GoRoute(
      path: rtProductDelete,
      redirect: isAuthenticated,
      pageBuilder: (context, state) {
        final product = state.extra as Product;
        return buildPage(
          context,
          state,
          ProductDeleteScreen(product: product),
        );
      },
    ),
  ],
);
