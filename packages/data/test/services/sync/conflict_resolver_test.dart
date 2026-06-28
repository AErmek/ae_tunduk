import 'package:cv_scan_data/src/services/sync/conflict_resolution.dart';
import 'package:cv_scan_data/src/services/sync/conflict_resolver.dart';
import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/builders.dart';

void main() {
  const resolver = ConflictResolver();

  ConflictResolution resolve(
    ConflictStrategy strategy, {
    String? localStatus,
    String? localNote,
    Candidate? current,
  }) => resolver.resolve(
    strategy: strategy,
    conflict: syncConflict(currentVersion: 5, current: current),
    localStatus: localStatus,
    localNote: localNote,
  );

  group('serverWins', () {
    test('always discards local intent', () {
      expect(resolve(ConflictStrategy.serverWins, localStatus: 'invited', localNote: 'mine'), isA<AcceptServer>());
    });
  });

  group('clientWins', () {
    test('rebases local status and note onto the server version', () {
      final resolution = resolve(ConflictStrategy.clientWins, localStatus: 'invited', localNote: 'mine');

      expect(
        resolution,
        isA<Rebase>()
            .having((r) => r.baseVersion, 'baseVersion', 5)
            .having((r) => r.status, 'status', 'invited')
            .having((r) => r.note, 'note', 'mine'),
      );
    });
  });

  group('merge notes', () {
    Rebase mergeWith({String? server, String? local}) =>
        resolve(ConflictStrategy.merge, localNote: local, current: candidate(note: server)) as Rebase;

    test('takes local when server note is empty', () {
      expect(mergeWith(server: null, local: 'mine').note, 'mine');
      expect(mergeWith(server: '', local: 'mine').note, 'mine');
    });

    test('takes server when local note is empty', () {
      expect(mergeWith(server: 'theirs', local: null).note, 'theirs');
      expect(mergeWith(server: 'theirs', local: '').note, 'theirs');
    });

    test('keeps a single note when both sides match', () {
      expect(mergeWith(server: 'same', local: 'same').note, 'same');
    });

    test('joins both notes with a separator when they diverge', () {
      expect(mergeWith(server: 'theirs', local: 'mine').note, 'theirs\n---\nmine');
    });

    test('rebases onto the server version', () {
      expect(mergeWith(server: 'theirs', local: 'mine').baseVersion, 5);
    });
  });
}
