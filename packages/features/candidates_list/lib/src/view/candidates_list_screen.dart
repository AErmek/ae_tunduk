import 'package:cv_scan_ui_kit/ui_kit.dart';
import 'package:feature_candidates_list/src/bloc/candidates_list_bloc.dart';
import 'package:feature_candidates_list/src/widgets/bottom_loader.dart';
import 'package:feature_candidates_list/src/widgets/candidate_tile.dart';
import 'package:feature_candidates_list/src/widgets/offline_banner.dart';
import 'package:feature_candidates_list/src/widgets/search_field.dart';
import 'package:feature_candidates_list/src/widgets/sort_menu.dart';
import 'package:feature_candidates_list/src/widgets/verdict_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared/shared.dart';

class CandidatesListScreen extends StatelessWidget {
  const CandidatesListScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (_) =>
        CandidatesListBloc(getCandidates: GetIt.I(), fetchCandidates: GetIt.I(), networkMonitor: GetIt.I())
          ..add(const CandidatesListEvent.started()),
    child: const _CandidatesListView(),
  );
}

class _CandidatesListView extends StatefulWidget {
  const _CandidatesListView();

  @override
  State<_CandidatesListView> createState() => _CandidatesListViewState();
}

class _CandidatesListViewState extends State<_CandidatesListView> with InfiniteScrollObserverMixin {
  @override
  bool get canLoadMore => _bloc.state.hasMore;

  @override
  bool get isLoading => _bloc.state.loadMore.isLoading;

  @override
  void onLoadMore() => context.read<CandidatesListBloc>().add(const CandidatesListEvent.nextPageRequested());

  CandidatesListBloc get _bloc => context.read<CandidatesListBloc>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(context.t.candidatesTitle),
      actions: [SortMenu(onChanged: (sort) => _bloc.add(CandidatesListEvent.sortChanged(sort)))],
    ),
    body: SafeArea(
      child: Column(
        children: [
          SearchField(onChanged: (q) => _bloc.add(CandidatesListEvent.queryChanged(q))),
          VerdictFilter(onChanged: (v) => _bloc.add(CandidatesListEvent.verdictChanged(v))),
          const OfflineBanner(),
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
                  return Center(child: Text(context.t.candidatesEmpty));
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    _bloc.add(const CandidatesListEvent.refreshed());
                    await _bloc.stream.firstWhere((s) => !s.refresh.isLoading);
                  },
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: state.items.length + 1,
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    itemExtentBuilder: (index, dimensions) {
                      if (index == state.items.length) {
                        return BottomLoader.height;
                      }
                      return CandidateTile.height;
                    },
                    itemBuilder: (context, index) {
                      if (index == state.items.length) {
                        return BottomLoader(loading: state.loadMore.isLoading, hasMore: state.hasMore);
                      }
                      final candidate = state.items[index];
                      return CandidateTile(
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
    ),
  );
}
