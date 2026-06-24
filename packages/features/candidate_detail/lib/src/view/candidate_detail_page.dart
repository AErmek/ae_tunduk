import 'package:flutter/material.dart';

class CandidateDetailPage extends StatelessWidget {
  const CandidateDetailPage({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: Center(child: Text('Candidate $id')),
  );
}
