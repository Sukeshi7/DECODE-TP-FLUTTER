import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../config/routes.dart';
import '../notifiers/session_notifier.dart';

String? isAuthenticated(BuildContext context, GoRouterState state) {
  final session = context.read<SessionNotifier>();

  if (session.isAuthenticated) {
    return null;
  }

  return rtLogin;
}
