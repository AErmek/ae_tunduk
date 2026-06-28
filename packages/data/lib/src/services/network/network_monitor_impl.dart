import 'dart:async';

import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// [NetworkMonitor] that checks real internet access, not just the interface.
class NetworkMonitorImpl implements NetworkMonitor {
  NetworkMonitorImpl({InternetConnection? connection}) : _connection = connection ?? InternetConnection() {
    _subscription = _connection.onStatusChange.listen(_onStatus);
  }

  final InternetConnection _connection;
  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  late final StreamSubscription<InternetStatus> _subscription;

  bool _isOnline = true;

  @override
  bool get isOnline => _isOnline;

  @override
  Stream<bool> get onlineChanges => _controller.stream;

  void _onStatus(InternetStatus status) {
    final online = status == InternetStatus.connected;
    if (online == _isOnline) return;
    _isOnline = online;
    _controller.add(online);
  }

  void dispose() {
    _subscription.cancel();
    _controller.close();
  }
}
