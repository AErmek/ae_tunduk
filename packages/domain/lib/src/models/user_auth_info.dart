import 'package:equatable/equatable.dart';

sealed class UserAuthInfo extends Equatable {
  const UserAuthInfo();

  @override
  List<Object?> get props => [runtimeType];
}

enum UserLockedStatus {
  unlocked,
  coldStart,
  overlay;

  bool get isLocked => this != UserLockedStatus.unlocked;

  bool canOverride(UserLockedStatus newValue) {
    if (this == UserLockedStatus.unlocked) return true;
    if (this == UserLockedStatus.coldStart) return newValue == UserLockedStatus.unlocked;
    if (this == UserLockedStatus.overlay) return newValue == UserLockedStatus.unlocked;
    return false;
  }
}

final class AuthorizedUser extends UserAuthInfo {
  const AuthorizedUser({required this.lockedStatus});

  final UserLockedStatus lockedStatus;

  @override
  List<Object?> get props => [runtimeType, lockedStatus];
}

final class UnauthorizedUser extends UserAuthInfo {
  const UnauthorizedUser();

  @override
  List<Object?> get props => [runtimeType];
}

final class RestoringUser extends UserAuthInfo {
  const RestoringUser();

  @override
  List<Object?> get props => [runtimeType];
}
