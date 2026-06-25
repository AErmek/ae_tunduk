import 'package:cv_scan_app/src/routing/utils/redirect_chain.dart';
import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

final class AuthGuard extends RedirectGuard {
  @override
  RouteMatcher get routeMatcher => const PathExcludeMatcher([AppRoutes.lock, AppRoutes.setupPin]);

  @override
  GuardResult redirect(BuildContext context, GoRouterState state) {
    final authState = context.read<AuthStatusBloc>().state;

    return authState.map(
      restoring: (_) => const GuardStop(),
      authenticated: (_) => const GuardNext(),
      unauthenticated: (_) => const GuardRedirect(AppRoutes.lock),
    );
  }
}
