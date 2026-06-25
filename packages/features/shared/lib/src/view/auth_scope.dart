import 'dart:async';

import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';
import 'package:shared/src/extensions/build_context_extension.dart';

/// Scope that controls the authentication state
class AuthScope extends StatefulWidget {
  const AuthScope({required this.child, super.key});

  final Widget child;

  static AuthStatusBloc blocOf(BuildContext context) => context.inhOf<_AuthInherited>(listen: false).bloc;

  static UserAuthInfo? infoOf(BuildContext context, {bool listen = true}) =>
      context.inhOf<_AuthInherited>(listen: listen).state.info;

  static AuthStatusState stateOf(BuildContext context, {bool listen = true}) =>
      context.inhOf<_AuthInherited>(listen: listen).state;

  @override
  State<AuthScope> createState() => _AuthScopeState();
}

class _AuthScopeState extends State<AuthScope> {
  late final AuthStatusBloc _bloc;
  late final AuthRepository _repository;
  late final StreamSubscription<AuthStatusState> _subscription;
  late AuthStatusState _state;

  @override
  void initState() {
    super.initState();

    _bloc = AuthStatusBloc(
      watchAuthStatus: GetIt.I.get<WatchAuthStatusUseCase>(),
      setLockedStatus: GetIt.I.get<AuthSetLockedStatusUseCase>(),
      restoreStatus: GetIt.I.get<AuthRestoreStatusUseCase>(),
    )..add(const AuthStatusEvent.restored());

    _state = _bloc.state;
    //TODO improve distinct
    _subscription = _bloc.stream.distinct().listen((state) {
      setState(() {
        _state = state;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      _AuthInherited(bloc: _bloc, state: _state, repository: _repository, child: widget.child);
}

final class _AuthInherited extends InheritedWidget {
  const _AuthInherited({required super.child, required this.bloc, required this.state, required this.repository});

  final AuthRepository repository;

  final AuthStatusState state;

  final AuthStatusBloc bloc;

  @override
  bool updateShouldNotify(covariant _AuthInherited oldWidget) => state != oldWidget.state;
}
