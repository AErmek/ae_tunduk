sealed class UserAuthInfo {
  const UserAuthInfo();
}

enum UserLockedStatus {
  unlocked,
  coldStart,
  overlay;

  bool get isLocked => this != UserLockedStatus.unlocked;
}

final class AuthorizedUser extends UserAuthInfo {
  const AuthorizedUser({required this.lockedStatus});

  final UserLockedStatus lockedStatus;
}

final class UnauthorizedUser extends UserAuthInfo {
  const UnauthorizedUser();
}

final class RestoringUser extends UserAuthInfo {
  const RestoringUser();
}
