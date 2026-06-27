import 'package:cv_scan_app/src/routing/app_router_impl.dart';
import 'package:cv_scan_app/src/routing/guards/authenticated_guard.dart';
import 'package:cv_scan_app/src/routing/guards/cold_start_guard.dart';
import 'package:cv_scan_app/src/routing/navigator_keys.dart';
import 'package:cv_scan_app/src/routing/routes/app_routes_meta.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

mixin RouterStateMixin<T extends StatefulWidget> on State<T> {
  late final GoRouter router;
  late final AppRouter appRouter;
  late final AuthStatusBloc authBloc;
  late StreamToListenable<AuthStatusState> _authListenable;

  @override
  void initState() {
    authBloc = AuthScope.blocOf(context);

    _authListenable = StreamToListenable(authBloc.stream.distinct((previous, next) => next.routerDistinct(previous)));

    router = GoRouter(
      navigatorKey: rootNavigatorKey,
      routes: $appRoutes,
      initialLocation: const CandidatesRoute().location,
      refreshListenable: _authListenable,
      redirect: RedirectChain([AuthenticatedGuard(authBloc), ColdStartGuard(authBloc)]).call,
    );

    appRouter = AppRouterImpl(router);

    super.initState();
  }

  @override
  void dispose() {
    _authListenable.dispose();
    router.dispose();
    super.dispose();
  }
}
