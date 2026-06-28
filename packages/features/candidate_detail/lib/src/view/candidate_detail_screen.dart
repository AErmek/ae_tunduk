import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_candidate_detail/src/bloc/candidate_detail_bloc.dart';
import 'package:feature_candidate_detail/src/widgets/contacts_section.dart';
import 'package:feature_candidate_detail/src/widgets/info_section.dart';
import 'package:feature_candidate_detail/src/widgets/note_editor.dart';
import 'package:feature_candidate_detail/src/widgets/status_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared/shared.dart';

class CandidateDetailScreen extends StatelessWidget {
  const CandidateDetailScreen({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => CandidateDetailBloc(
      id: id,
      getCandidate: GetIt.I(),
      fetchCandidate: GetIt.I(),
      updateCandidate: GetIt.I(),
      watchPending: GetIt.I(),
      networkMonitor: GetIt.I(),
    )..add(const CandidateDetailEvent.started()),
    child: const _CandidateDetailView(),
  );
}

class _CandidateDetailView extends StatelessWidget {
  const _CandidateDetailView();

  void _onState(BuildContext context, CandidateDetailState state) {
    if (state.save.isFailTriggered) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(state.save.failure?.message ?? context.t.candidateDetailSaveError)));
    }
    if (state.share.isDoneTriggered) {
      final link = state.share.data;
      if (link != null) Share.share(link);
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: BlocConsumer<CandidateDetailBloc, CandidateDetailState>(
      listenWhen: (p, c) => c.save.isFailTriggered || c.share.isDoneTriggered,
      listener: _onState,
      builder: (context, state) {
        final candidate = state.candidate;
        if (candidate == null) {
          if (state.load.isLoading) return const Center(child: CircularProgressIndicator());
          return _NotFound(message: state.load.failure?.message ?? context.t.candidateDetailNotFound);
        }
        return _Content(state: state, candidate: candidate);
      },
    ),
  );
}

class _Content extends StatelessWidget {
  const _Content({required this.state, required this.candidate});

  final CandidateDetailState state;
  final Candidate candidate;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<CandidateDetailBloc>();
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          pinned: true,
          title: Text(candidate.name),
          actions: [
            IconButton(
              icon: const Icon(Icons.share_outlined),
              tooltip: context.t.candidateDetailShare,
              onPressed: () => bloc.add(const CandidateDetailEvent.shareRequested()),
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Text(candidate.posLabel, style: theme.textTheme.titleMedium),
            ),
            _Header(candidate: candidate, hasPending: state.hasPending),
            InfoSection(
              title: context.t.candidateDetailStatus,
              child: StatusSelector(
                status: candidate.status,
                enabled: !state.save.isLoading,
                onChanged: (s) => bloc.add(CandidateDetailEvent.statusChanged(s)),
              ),
            ),
            if (candidate.summary case final summary?)
              InfoSection(
                title: context.t.candidateDetailSummary,
                child: Text(summary, style: theme.textTheme.bodyMedium),
              ),
            if (candidate.exp case final exp? when exp.isNotEmpty)
              InfoSection(
                title: context.t.candidateDetailExperience,
                child: _Rows(rows: exp),
              ),
            if (candidate.stack case final stack?)
              InfoSection(
                title: context.t.candidateDetailSkills,
                child: Text(stack, style: theme.textTheme.bodyMedium),
              ),
            if (candidate.edu case final edu?)
              InfoSection(
                title: context.t.candidateDetailEducation,
                child: Text(edu, style: theme.textTheme.bodyMedium),
              ),
            if (candidate.criteria case final criteria? when criteria.isNotEmpty)
              InfoSection(
                title: context.t.candidateDetailCriteria,
                child: _Rows(rows: criteria),
              ),
            if (candidate.questions case final questions? when questions.isNotEmpty)
              InfoSection(
                title: context.t.candidateDetailQuestions,
                child: _Bullets(items: questions),
              ),
            ContactsSection(candidate: candidate),
            NoteEditor(
              note: candidate.note,
              saving: state.save.isLoading,
              onSubmit: (note) => bloc.add(CandidateDetailEvent.noteSubmitted(note)),
            ),
            const SizedBox(height: 32),
          ]),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.candidate, required this.hasPending});

  final Candidate candidate;
  final bool hasPending;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
    child: Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        StatusBadge(
          label: Text(context.t.verdictDisplayName(candidate.verdict.name)),
          color: candidate.verdictTone.getColor(context.themeColors),
        ),

        if (hasPending)
          CustomChip(
            height: 24,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.sync_outlined, size: 16),
                const SizedBox(width: 4),
                Flexible(child: Text(context.t.candidateDetailNotSynced)),
              ],
            ),
          ),
      ],
    ),
  );
}

class _Rows extends StatelessWidget {
  const _Rows({required this.rows});

  final List<List<String>> rows;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rows
          .map(
            (row) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(row.where((s) => s.isNotEmpty).join(' · '), style: theme.textTheme.bodyMedium),
            ),
          )
          .toList(),
    );
  }
}

class _Bullets extends StatelessWidget {
  const _Bullets({required this.items});

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('•  '),
                  Expanded(child: Text(item, style: theme.textTheme.bodyMedium)),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

class _NotFound extends StatelessWidget {
  const _NotFound({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.person_off_outlined, size: 48),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
        ],
      ),
    ),
  );
}
