import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:cv_scan_app/src/bloc/app_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void $configureBloc() {
  // Setup bloc observer and transformer
  Bloc.observer = AppBlocObserver();
  Bloc.transformer = bloc_concurrency.sequential();
}
