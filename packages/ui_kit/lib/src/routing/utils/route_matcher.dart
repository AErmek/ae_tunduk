import 'package:go_router/go_router.dart';

/// Type-safe route matching over the full router state — no raw regex.
abstract interface class RouteMatcher {
  bool matches(GoRouterState state);
}

/// Boolean composition so new rules are expressed by combining matchers
/// rather than adding a class per case.
extension RouteMatcherCombinators on RouteMatcher {
  RouteMatcher operator ~() => NotMatcher(this);
  RouteMatcher operator &(RouteMatcher other) => AllOf([this, other]);
  RouteMatcher operator |(RouteMatcher other) => AnyOf([this, other]);
}

/// Matches paths that exactly equal or start with one of the given paths.
///
/// For "/authorize" matches: "/authorize", "/authorize/extra".
/// For "/" matches only: "/".
final class PathMatcher implements RouteMatcher {
  const PathMatcher(this.paths);

  final List<String> paths;

  @override
  bool matches(GoRouterState state) {
    final path = state.matchedLocation;
    return paths.any((p) {
      if (path == p) return true;
      if (p == '/' || p.isEmpty) return false;
      return path.startsWith('$p/');
    });
  }
}

/// Matches any path.
final class AnyRouteMatcher implements RouteMatcher {
  const AnyRouteMatcher();

  @override
  bool matches(GoRouterState state) => true;
}

/// Inverts the wrapped matcher.
final class NotMatcher implements RouteMatcher {
  const NotMatcher(this.inner);

  final RouteMatcher inner;

  @override
  bool matches(GoRouterState state) => !inner.matches(state);
}

/// Matches when any of the wrapped matchers match.
final class AnyOf implements RouteMatcher {
  const AnyOf(this.matchers);

  final List<RouteMatcher> matchers;

  @override
  bool matches(GoRouterState state) => matchers.any((m) => m.matches(state));
}

/// Matches when all of the wrapped matchers match.
final class AllOf implements RouteMatcher {
  const AllOf(this.matchers);

  final List<RouteMatcher> matchers;

  @override
  bool matches(GoRouterState state) => matchers.every((m) => m.matches(state));
}
