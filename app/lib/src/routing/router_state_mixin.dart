// import 'package:bengal_app/core/router/config/redirect_chain.dart';
// import 'package:bengal_app/core/router/routes/events_route.dart';
// import 'package:bengal_app/core/router/routes/home_route.dart';
// // import 'package:bengal_app/core/router/guard/auth_guard.dart';
// // import 'package:bengal_app/core/router/guard/restoring_guard.dart';
// // import 'package:bengal_app/core/router/routes/authorize_route.dart';
// import 'package:bengal_app/core/router/routes/main_shell_route.dart';
// import 'package:bengal_app/core/router/routes/map_route.dart';
// import 'package:bengal_app/core/router/routes/profile_route.dart';
// // import 'package:bengal_app/core/router/routes/main_shell_route.dart';
// // import 'package:bengal_app/core/router/routes/notifications_route.dart';
// // import 'package:bengal_app/core/router/routes/profile_route.dart';
// // import 'package:bengal_app/core/router/routes/restoring_route.dart';
// // import 'package:bengal_app/core/util/stream/stream_to_listenable.dart';
// // import 'package:bengal_app/feature/auth/bloc/auth_bloc.dart';
// // import 'package:bengal_app/feature/auth/widget/auth_scope.dart';
import 'package:cv_scan_app/src/routing/app_routes_meta.dart';
import 'package:cv_scan_app/src/routing/utils/redirect_chain.dart';
import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

mixin RouterStateMixin<T extends StatefulWidget> on State<T> {
  late final GoRouter router;

  late AuthStatusBloc authBloc;

  late StreamToListenable<AuthStatusState> _authListenable;

  @override
  void dispose() {
    _authListenable.dispose();
    router.dispose();
    super.dispose();
  }

  @override
  void initState() {
    authBloc = AuthScope.blocOf(context);

    _authListenable = StreamToListenable(authBloc.stream.distinct((previous, next) => next.routerDistinct(previous)));

    // final routerListenable = Listenable.merge([_authListenable]);

    // Create router.
    router = GoRouter(
      navigatorKey: rootNavigatorKey,
      routes: appRoutesMeta,
      initialLocation: AppRoutes.candidatesList,
      refreshListenable: _authListenable,
      redirect: const RedirectChain([
        // SplashGuard(),
        // RestoringGuard(),
        // AuthenticatedGuard(),
        // AnonymousGuard(),
        // RedirectIfAuthenticatedGuard(),
        // RedirectIfUnauthenticatedGuard(),
      ]).call,
    );

    super.initState();
  }
}
