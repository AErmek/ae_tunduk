import 'package:cv_scan_app/src/view/lock_overlay_wrapper.dart';
import 'package:flutter/widgets.dart';

final Key _builderKey = GlobalKey();

class AppBuilder extends StatelessWidget {
  const AppBuilder({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) => MediaQuery(
    key: _builderKey,
    data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
    child: LockOverlayWrapper(child: child),
  );
}
