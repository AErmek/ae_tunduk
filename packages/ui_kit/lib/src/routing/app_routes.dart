abstract final class AppRoutes {
  static const restoring = '/restoring';
  static const lock = '/lock';
  static const lockDialog = '/lock-dialog';
  static const setupPin = '/setup-pin';
  static const candidatesList = '/candidates';
  static const settings = '/settings';
  static const candidateDetail = '/candidates/:id';

  static String candidateDetailPath(String id) => '/candidates/$id';
}
