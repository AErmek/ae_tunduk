import 'dart:developer' as developer;

import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [BlocObserver] which logs all bloc state changes, errors and events.
class AppBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc<Object?, Object?> bloc, Transition<Object?, Object?> transition) {
    final logMessage = StringBuffer()
      ..writeln('Bloc: ${bloc.runtimeType}')
      ..writeln('Event: ${transition.event.runtimeType}')
      ..writeln(
        'Transition: ${transition.currentState.runtimeType} => '
        '${transition.nextState.runtimeType}',
      )
      ..writeln('Old State: ${transition.currentState?.toString().limit(100)}')
      ..write('New State: ${transition.nextState?.toString().limit(100)}');

    developer.log(logMessage.toString(), name: 'Bloc');
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    final logMessage = StringBuffer()
      ..writeln('Bloc: ${bloc.runtimeType}')
      ..writeln('Event: ${event.runtimeType}')
      ..write('Details: ${event?.toString().limit(200)}');

    developer.log(logMessage.toString(), name: 'Bloc');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    final logMessage = StringBuffer()
      ..writeln('Bloc: ${bloc.runtimeType}')
      ..writeln(error.toString());

    developer.log(logMessage.toString(), name: 'Bloc', level: 1000, error: error, stackTrace: stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
