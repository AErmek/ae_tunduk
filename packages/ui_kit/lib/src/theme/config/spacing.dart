class Spacing {
  const factory Spacing(double rate) = Spacing._rate;
  const Spacing._(this.value);
  const factory Spacing.exact(double value) = Spacing._exact;

  const Spacing._rate(double rate) : value = rate * 4;
  const Spacing._exact(double value) : this._(value);

  static const unit = Spacing._(1);
  static const zero = Spacing._(0);

  final double value;

  Spacing operator +(Spacing other) => Spacing.exact(value + other.value);
  Spacing operator -(Spacing other) => Spacing.exact(value - other.value);
  Spacing operator *(double factor) => Spacing.exact(value * factor);

  @override
  String toString() => 'Spacing($value)';
}
