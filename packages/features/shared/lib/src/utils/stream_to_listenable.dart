import 'dart:async';

import 'package:flutter/material.dart';

class StreamToListenable<T extends Object> extends ChangeNotifier implements Listenable {
  StreamToListenable(this._stateChanges) {
    _subscription = _stateChanges.listen((final event) {
      notifyListeners();
    });
  }
  final Stream<T> _stateChanges;
  StreamSubscription<T>? _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
