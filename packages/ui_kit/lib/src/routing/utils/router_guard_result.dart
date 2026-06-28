sealed class GuardResult {
  const GuardResult();
}

final class GuardRedirect extends GuardResult {
  const GuardRedirect(this.location);
  final String location;
}

final class GuardNext extends GuardResult {
  const GuardNext();
}

final class GuardStop extends GuardResult {
  const GuardStop();
}
