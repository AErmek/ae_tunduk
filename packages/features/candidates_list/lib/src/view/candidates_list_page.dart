import 'package:flutter/material.dart';

class CandidatesListPage extends StatelessWidget {
  const CandidatesListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [const Text('Candidates'), TextFormField()],
      ),
    ),
  );
}
