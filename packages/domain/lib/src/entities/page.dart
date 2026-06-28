import 'package:equatable/equatable.dart';

class Page<T> extends Equatable {
  const Page({
    required this.items,
    required this.page,
    required this.size,
    required this.total,
  });

  final List<T> items;
  final int page;
  final int size;
  final int total;

  bool get isLastPage => (page + 1) * size >= total;

  @override
  List<Object?> get props => [items, page, size, total];
}
