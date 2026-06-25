/// Type-safe route matching without raw regex.
abstract interface class RouteMatcher {
  bool matches(String path);
}

/// Matches paths that exactly equal or start with one of the given paths.
///
/// For path "/authorize" matches: "/authorize", "/authorize/", "/authorize/extra".
/// For path "/" matches only: "/".
final class PathMatcher implements RouteMatcher {
  const PathMatcher(this.paths);

  final List<String> paths;

  @override
  bool matches(String path) => paths.any((p) {
        if (path == p) return true;
        if (p == '/' || p.isEmpty) return false;
        return path.startsWith('$p/');
      });
}

/// Matches any path.
final class AnyRouteMatcher implements RouteMatcher {
  const AnyRouteMatcher();

  @override
  bool matches(String path) => true;
}

/// Matches all paths except those matched by [excludedPaths].
final class PathExcludeMatcher implements RouteMatcher {
  const PathExcludeMatcher(this.excludedPaths);

  final List<String> excludedPaths;

  @override
  bool matches(String path) => !PathMatcher(excludedPaths).matches(path);
}
