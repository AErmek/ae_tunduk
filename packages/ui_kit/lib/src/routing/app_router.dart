import 'package:flutter/widgets.dart';

abstract interface class AppRouter {
  void goToCandidatesList();
  void goToCandidateDetail(String id);
  void goBack();
}

/// Exposes the [AppRouter] to features without depending on the app's routes.
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
