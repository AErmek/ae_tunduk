abstract final class AppRoutes {
  static const candidatesList = '/candidates';
  static const candidateDetail = '/candidates/:id';

  static String candidateDetailPath(String id) => '/candidates/$id';
}
