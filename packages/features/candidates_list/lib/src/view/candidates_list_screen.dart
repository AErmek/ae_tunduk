import 'package:cv_scan_domain/cv_scan_domain.dart';
import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_candidates_list/src/bloc/candidates_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CandidatesListScreen extends StatelessWidget {
  const CandidatesListScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) => CandidatesListBloc(
      getCandidates: GetIt.I(),
      fetchCandidates: GetIt.I(),
      networkMonitor: GetIt.I(),
    )..add(const CandidatesListEvent.started()),
    child: const _CandidatesListView(),
  );
}

class _CandidatesListView extends StatefulWidget {
  const _CandidatesListView();

  @override
  State<_CandidatesListView> createState() => _CandidatesListViewState();
}

class _CandidatesListViewState extends State<_CandidatesListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 300) {
      context.read<CandidatesListBloc>().add(const CandidatesListEvent.nextPageRequested());
    }
  }

  CandidatesListBloc get _bloc => context.read<CandidatesListBloc>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Кандидаты')),
    body: Column(
      children: [
        _SearchField(onChanged: (q) => _bloc.add(CandidatesListEvent.queryChanged(q))),
        _VerdictFilter(onChanged: (v) => _bloc.add(CandidatesListEvent.verdictChanged(v))),
        const _OfflineBanner(),
        Expanded(
          child: BlocConsumer<CandidatesListBloc, CandidatesListState>(
            listenWhen: (p, c) => c.loadMore.isFailTriggered || c.refresh.isFailTriggered,
            listener: (context, state) {
              final failure = state.loadMore.failure ?? state.refresh.failure;
              if (failure != null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(failure.message)));
              }
            },
            builder: (context, state) {
              if (state.items.isEmpty && state.refresh.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.items.isEmpty) {
                return const Center(child: Text('Кандидатов нет'));
              }
              return RefreshIndicator(
                onRefresh: () async {
                  _bloc.add(const CandidatesListEvent.refreshed());
                  await _bloc.stream.firstWhere((s) => !s.refresh.isLoading);
                },
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: state.items.length + 1,
                  itemBuilder: (context, index) {
                    if (index == state.items.length) {
                      return _BottomLoader(loading: state.loadMore.isLoading, hasMore: state.hasMore);
                    }
                    final candidate = state.items[index];
                    return _CandidateTile(
                      candidate: candidate,
                      onTap: () => context.appRouter.goToCandidateDetail(candidate.id),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
    child: TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: 'Поиск по имени или позиции',
        border: OutlineInputBorder(),
        isDense: true,
      ),
    ),
  );
}

class _VerdictFilter extends StatelessWidget {
  const _VerdictFilter({required this.onChanged});

  final ValueChanged<CandidateVerdict?> onChanged;

  @override
  Widget build(BuildContext context) {
    final selected = context.select((CandidatesListBloc b) => b.state.filter.verdict);
    return SizedBox(
      height: 48,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          for (final verdict in CandidateVerdict.values)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FilterChip(
                label: Text(verdict.apiKey),
                selected: selected == verdict,
                onSelected: (on) => onChanged(on ? verdict : null),
              ),
            ),
        ],
      ),
    );
  }
}

class _OfflineBanner extends StatelessWidget {
  const _OfflineBanner();

  @override
  Widget build(BuildContext context) {
    final isOnline = context.select((CandidatesListBloc b) => b.state.isOnline);
    if (isOnline) return const SizedBox.shrink();
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.errorContainer,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Text(
        'Нет сети — показаны сохранённые данные',
        style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
      ),
    );
  }
}

class _BottomLoader extends StatelessWidget {
  const _BottomLoader({required this.loading, required this.hasMore});

  final bool loading;
  final bool hasMore;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (!hasMore) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: Text('Это все кандидаты')),
      );
    }
    return const SizedBox(height: 24);
  }
}

class _CandidateTile extends StatelessWidget {
  const _CandidateTile({required this.candidate, required this.onTap});

  final Candidate candidate;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => ListTile(
    onTap: onTap,
    title: Text(candidate.name),
    subtitle: Text(candidate.posLabel),
    trailing: _VerdictBadge(verdict: candidate.verdict, tone: candidate.verdictTone),
  );
}

class _VerdictBadge extends StatelessWidget {
  const _VerdictBadge({required this.verdict, required this.tone});

  final CandidateVerdict verdict;
  final CandidateVerdictTone tone;

  Color _color() => switch (tone) {
    CandidateVerdictTone.green => Colors.green,
    CandidateVerdictTone.orange => Colors.orange,
    CandidateVerdictTone.red => Colors.red,
  };

  @override
  Widget build(BuildContext context) {
    final color = _color();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(verdict.apiKey, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12)),
    );
  }
}
