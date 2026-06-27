import 'package:flutter/material.dart';

class CandidateDetailScreen extends StatelessWidget {
  const CandidateDetailScreen({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: Center(child: Text('Candidate $id')),
  );
}
