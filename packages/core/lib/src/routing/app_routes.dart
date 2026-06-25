abstract final class AppRoutes {
  static const lock = '/lock';
  static const setupPin = '/setup-pin';
  static const candidatesList = '/candidates';
  static const candidateDetail = '/candidates/:id';

  static String candidateDetailPath(String id) => '/candidates/$id';
}
