import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  final _traceIds = <int, String>{};

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    final traceId = _shortId();
    if (event != null) _traceIds[identityHashCode(event)] = traceId;

    developer.log('[$traceId] ${bloc.runtimeType} ← ${event.runtimeType}', name: 'Bloc');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc<Object?, Object?> bloc, Transition<Object?, Object?> transition) {
    final traceId = _traceIds.remove(identityHashCode(transition.event)) ?? _shortId();

    developer.log(
      '[$traceId] ${bloc.runtimeType} '
      '${transition.currentState.runtimeType} → ${transition.nextState.runtimeType}\n'
      '  before: ${transition.currentState}\n'
      '  after:  ${transition.nextState}',
      name: 'Bloc',
    );
    super.onTransition(bloc, transition);
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    developer.log('${bloc.runtimeType} ERROR: $error', name: 'Bloc', level: 1000, error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  String _shortId() {
    final now = DateTime.now().microsecondsSinceEpoch;
    return (now & 0xFFFFFF).toRadixString(16).padLeft(6, '0');
  }
}
