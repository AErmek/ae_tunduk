enum ConflictStrategy {
  serverWins,
  clientWins,
  merge;

  static ConflictStrategy byName(String name) => ConflictStrategy.values.byName(name);
}
