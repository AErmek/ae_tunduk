import 'dart:async';

import 'package:stream_transform/stream_transform.dart';

/// Emits whenever either source emits, pairing the latest value of each.
/// Starts emitting once both sources have produced at least one value.
Stream<R> combineLatest2<A, B, R>(Stream<A> streamA, Stream<B> streamB, R Function(A a, B b) combiner) =>
    streamA.combineLatest(streamB, combiner);
