import 'package:equatable/equatable.dart';
import 'package:cv_scan_domain/src/enums/candidate_status.dart';
import 'package:cv_scan_domain/src/enums/candidate_verdict.dart';
import 'package:cv_scan_domain/src/enums/verdict_color.dart';

class Candidate extends Equatable {
  const Candidate({
    required this.id,
    required this.name,
    required this.position,
    required this.posLabel,
    required this.verdict,
    required this.verdictColor,
    required this.status,
    required this.version,
    this.file,
    this.email,
    this.phone,
    this.city,
    this.tg,
    this.exp,
    this.totalExp,
    this.stack,
    this.edu,
    this.criteria,
    this.summary,
    this.questions,
    this.note,
    this.dateAdded,
  });

  final String id;
  final String name;
  final String position;
  final String posLabel;
  final CandidateVerdict verdict;
  final VerdictColor verdictColor;
  final CandidateStatus status;
  final int version;
  final String? file;
  final String? email;
  final String? phone;
  final String? city;
  final String? tg;
  final List<List<String>>? exp;
  final String? totalExp;
  final String? stack;
  final String? edu;
  final List<List<String>>? criteria;
  final String? summary;
  final List<String>? questions;
  final String? note;
  final DateTime? dateAdded;

  Candidate copyWith({
    CandidateStatus? status,
    String? note,
    int? version,
  }) {
    return Candidate(
      id: id,
      name: name,
      position: position,
      posLabel: posLabel,
      verdict: verdict,
      verdictColor: verdictColor,
      status: status ?? this.status,
      version: version ?? this.version,
      file: file,
      email: email,
      phone: phone,
      city: city,
      tg: tg,
      exp: exp,
      totalExp: totalExp,
      stack: stack,
      edu: edu,
      criteria: criteria,
      summary: summary,
      questions: questions,
      note: note ?? this.note,
      dateAdded: dateAdded,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        position,
        posLabel,
        verdict,
        verdictColor,
        status,
        version,
        file,
        email,
        phone,
        city,
        tg,
        exp,
        totalExp,
        stack,
        edu,
        criteria,
        summary,
        questions,
        note,
        dateAdded,
      ];
}
