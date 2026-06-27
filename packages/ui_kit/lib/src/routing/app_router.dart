import 'package:flutter/widgets.dart';

abstract interface class AppRouter {
  void goToCandidatesList();
  void goToCandidateDetail(String id);
  void goBack();
}

/// Delivers the [AppRouter] down the tree so features can navigate without
/// depending on the concrete routes defined in `app`. The implementation wraps
/// the router instance, so this scope is just a delivery channel — it carries a
/// stable object and never triggers rebuilds.
class AppRouterScope extends InheritedWidget {
  const AppRouterScope({required this.router, required super.child, super.key});

  final AppRouter router;

  static AppRouter of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppRouterScope>();
    assert(scope != null, 'AppRouterScope is missing above this context');
    return scope!.router;
  }

  @override
  bool updateShouldNotify(AppRouterScope oldWidget) => router != oldWidget.router;
}

extension AppRouterX on BuildContext {
  AppRouter get appRouter => AppRouterScope.of(this);
}
