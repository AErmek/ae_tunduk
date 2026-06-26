import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:feature_auth/feature_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

class LockOverlayWrapper extends StatelessWidget {
  const LockOverlayWrapper({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => BlocBuilder<AuthStatusBloc, AuthStatusState>(
    bloc: AuthScope.blocOf(context),
    buildWhen: (previous, current) {
      final prev = previous.info;
      final curr = current.info;
      if (prev is! AuthorizedUser || curr is! AuthorizedUser) return false;
      return prev.lockedStatus != curr.lockedStatus &&
          (prev.lockedStatus == UserLockedStatus.overlay ||
              curr.lockedStatus == UserLockedStatus.overlay);
    },
    builder: (context, state) {
      final info = state.info;
      final isOverlay = info is AuthorizedUser && info.lockedStatus == UserLockedStatus.overlay;

      return Stack(
        children: [
          child,
          if (isOverlay) const _LockNavigator(),
        ],
      );
    },
  );
}

class _LockNavigator extends StatelessWidget {
  const _LockNavigator();

  @override
  Widget build(BuildContext context) => Navigator(
    onDidRemovePage: (_) {},
    pages: const [MaterialPage(child: LockPage())],
  );
}
