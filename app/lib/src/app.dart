import 'package:cv_scan_app/src/routing/app_router.dart';
import 'package:flutter/material.dart';

class CvScanApp extends StatelessWidget {
  const CvScanApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'CV-Scan',
    theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1A73E8)), useMaterial3: true),
    routerConfig: appRouter,
  );
}
