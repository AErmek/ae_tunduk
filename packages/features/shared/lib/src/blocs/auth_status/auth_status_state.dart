part of 'auth_status_bloc.dart';

@freezed
abstract class AuthStatusState with _$AuthStatusState {
  const factory AuthStatusState(UserAuthInfo info) = _AuthStatusIdle;

  const AuthStatusState._();

  bool routerDistinct(AuthStatusState previous) => info == previous.info;
}
