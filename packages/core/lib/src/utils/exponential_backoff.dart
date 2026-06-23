import 'dart:math';

/// Geometric (exponential) backoff: delay = base * factor^attempt, capped at
/// [maxDelay], with optional jitter to avoid thundering-herd retries.
class ExponentialBackoff {
  const ExponentialBackoff({
    this.base = const Duration(milliseconds: 500),
    this.factor = 2.0,
    this.maxAttempts = 5,
    this.maxDelay = const Duration(seconds: 30),
    this.jitter = true,
  });

  final Duration base;
  final double factor;
  final int maxAttempts;
  final Duration maxDelay;
  final bool jitter;

  /// Delay before the given [attempt] (0-based: attempt 0 is the first retry).
  Duration delayFor(int attempt, {Random? random}) {
    final raw = base.inMilliseconds * pow(factor, attempt);
    final capped = min(raw, maxDelay.inMilliseconds.toDouble());
    if (!jitter) return Duration(milliseconds: capped.round());

    final rng = random ?? Random();
    final withJitter = capped * (0.5 + rng.nextDouble() * 0.5);
    return Duration(milliseconds: withJitter.round());
  }

  bool hasAttemptsLeft(int attempt) => attempt < maxAttempts;
}
