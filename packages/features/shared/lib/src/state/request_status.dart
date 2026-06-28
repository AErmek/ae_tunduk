import 'package:cv_scan_core/cv_scan_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'request_status.freezed.dart';

@freezed
sealed class RequestStatus<T extends Object> with _$RequestStatus {
  const RequestStatus._();

  const factory RequestStatus.idle() = IdleRequestStatus<T>;

  const factory RequestStatus.loading([Object? param]) = LoadingRequestStatus<T>;

  const factory RequestStatus.doneTrigger([T? data]) = DoneTriggerRequestStatus<T>;
  const factory RequestStatus.done([T? data]) = DoneRequestStatus<T>;
  const factory RequestStatus.doneRequired(T data) = DoneRequiredRequestStatus<T>;

  const factory RequestStatus.failTrigger(Failure failure) = FailTriggerRequestStatus<T>;
  const factory RequestStatus.fail(Failure failure) = FailRequestStatus<T>;

  bool get isLoading => this is LoadingRequestStatus;

  bool isLoadingWithParam(Object? compareParam) => switch (this) {
    LoadingRequestStatus(param: final param) => param == compareParam,
    _ => false,
  };

  T? get data => switch (this) {
    DoneRequestStatus(data: final data) => data,
    DoneTriggerRequestStatus(data: final data) => data,
    DoneRequiredRequestStatus(data: final data) => data,
    _ => null,
  };

  bool get isFail => this is FailRequestStatus || isFailTriggered;

  bool get isFailTriggered => this is FailTriggerRequestStatus;
  bool get isDoneTriggered => this is DoneTriggerRequestStatus;

  bool get isAnyTriggered => isDoneTriggered || isFailTriggered;

  Failure? get failure => switch (this) {
    FailTriggerRequestStatus(failure: final failure) => failure,
    FailRequestStatus(failure: final failure) => failure,
    _ => null,
  };
}
