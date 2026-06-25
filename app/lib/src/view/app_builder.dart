import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final Key _builderKey = GlobalKey();

class AppBuilder extends StatelessWidget {
  const AppBuilder({required this.router, required this.child, super.key});
  final GoRouter router;
  final Widget child;

  @override
  Widget build(BuildContext context) => MediaQuery(
    key: _builderKey,
    data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
    child: child,
  );
}
