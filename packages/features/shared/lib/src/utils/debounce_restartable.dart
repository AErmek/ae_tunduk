import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<TEvent> debounceRestartable<TEvent>(Duration duration) => (events, mapper) {
  final debouncedEvents = events.debounce(duration).distinct();

  return restartable<TEvent>().call(debouncedEvents, mapper);
};
