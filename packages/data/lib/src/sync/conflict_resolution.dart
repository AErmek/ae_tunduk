sealed class ConflictResolution {
  const ConflictResolution();
}

class AcceptServer extends ConflictResolution {
  const AcceptServer();
}

class Rebase extends ConflictResolution {
  const Rebase({required this.baseVersion, this.status, this.note});

  final int baseVersion;
  final String? status;
  final String? note;
}
