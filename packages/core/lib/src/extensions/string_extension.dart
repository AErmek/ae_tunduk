/// Common extensions for [String]
extension StringExtension on String {
  /// Returns a new string with the first [length] characters of this string.
  String limit(int length) => length < this.length ? substring(0, length) : this;

  String get lowercase => toLowerCase();
}

extension StringNullableExtension on String? {
  String? get lowercase => this?.toLowerCase();

  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;

  bool get isNotBlank => this != null && this!.trim().isNotEmpty;
  bool get isBlank => this == null || this!.trim().isEmpty;

  bool get hasNoError => this == null;

  String repeat(int n) {
    final self = this;
    return self == null ? '' : self * n;
  }
}
