// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RequestStatus<T extends Object> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestStatus<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RequestStatus<$T>()';
}


}

/// @nodoc
class $RequestStatusCopyWith<T extends Object,$Res>  {
$RequestStatusCopyWith(RequestStatus<T> _, $Res Function(RequestStatus<T>) __);
}


/// Adds pattern-matching-related methods to [RequestStatus].
extension RequestStatusPatterns<T extends Object> on RequestStatus<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( IdleRequestStatus<T> value)?  idle,TResult Function( LoadingRequestStatus<T> value)?  loading,TResult Function( DoneTriggerRequestStatus<T> value)?  doneTrigger,TResult Function( DoneRequestStatus<T> value)?  done,TResult Function( DoneRequiredRequestStatus<T> value)?  doneRequired,TResult Function( FailTriggerRequestStatus<T> value)?  failTrigger,TResult Function( FailRequestStatus<T> value)?  fail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case IdleRequestStatus() when idle != null:
return idle(_that);case LoadingRequestStatus() when loading != null:
return loading(_that);case DoneTriggerRequestStatus() when doneTrigger != null:
return doneTrigger(_that);case DoneRequestStatus() when done != null:
return done(_that);case DoneRequiredRequestStatus() when doneRequired != null:
return doneRequired(_that);case FailTriggerRequestStatus() when failTrigger != null:
return failTrigger(_that);case FailRequestStatus() when fail != null:
return fail(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( IdleRequestStatus<T> value)  idle,required TResult Function( LoadingRequestStatus<T> value)  loading,required TResult Function( DoneTriggerRequestStatus<T> value)  doneTrigger,required TResult Function( DoneRequestStatus<T> value)  done,required TResult Function( DoneRequiredRequestStatus<T> value)  doneRequired,required TResult Function( FailTriggerRequestStatus<T> value)  failTrigger,required TResult Function( FailRequestStatus<T> value)  fail,}){
final _that = this;
switch (_that) {
case IdleRequestStatus():
return idle(_that);case LoadingRequestStatus():
return loading(_that);case DoneTriggerRequestStatus():
return doneTrigger(_that);case DoneRequestStatus():
return done(_that);case DoneRequiredRequestStatus():
return doneRequired(_that);case FailTriggerRequestStatus():
return failTrigger(_that);case FailRequestStatus():
return fail(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( IdleRequestStatus<T> value)?  idle,TResult? Function( LoadingRequestStatus<T> value)?  loading,TResult? Function( DoneTriggerRequestStatus<T> value)?  doneTrigger,TResult? Function( DoneRequestStatus<T> value)?  done,TResult? Function( DoneRequiredRequestStatus<T> value)?  doneRequired,TResult? Function( FailTriggerRequestStatus<T> value)?  failTrigger,TResult? Function( FailRequestStatus<T> value)?  fail,}){
final _that = this;
switch (_that) {
case IdleRequestStatus() when idle != null:
return idle(_that);case LoadingRequestStatus() when loading != null:
return loading(_that);case DoneTriggerRequestStatus() when doneTrigger != null:
return doneTrigger(_that);case DoneRequestStatus() when done != null:
return done(_that);case DoneRequiredRequestStatus() when doneRequired != null:
return doneRequired(_that);case FailTriggerRequestStatus() when failTrigger != null:
return failTrigger(_that);case FailRequestStatus() when fail != null:
return fail(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( Object? param)?  loading,TResult Function( T? data)?  doneTrigger,TResult Function( T? data)?  done,TResult Function( T data)?  doneRequired,TResult Function( Failure failure)?  failTrigger,TResult Function( Failure failure)?  fail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case IdleRequestStatus() when idle != null:
return idle();case LoadingRequestStatus() when loading != null:
return loading(_that.param);case DoneTriggerRequestStatus() when doneTrigger != null:
return doneTrigger(_that.data);case DoneRequestStatus() when done != null:
return done(_that.data);case DoneRequiredRequestStatus() when doneRequired != null:
return doneRequired(_that.data);case FailTriggerRequestStatus() when failTrigger != null:
return failTrigger(_that.failure);case FailRequestStatus() when fail != null:
return fail(_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( Object? param)  loading,required TResult Function( T? data)  doneTrigger,required TResult Function( T? data)  done,required TResult Function( T data)  doneRequired,required TResult Function( Failure failure)  failTrigger,required TResult Function( Failure failure)  fail,}) {final _that = this;
switch (_that) {
case IdleRequestStatus():
return idle();case LoadingRequestStatus():
return loading(_that.param);case DoneTriggerRequestStatus():
return doneTrigger(_that.data);case DoneRequestStatus():
return done(_that.data);case DoneRequiredRequestStatus():
return doneRequired(_that.data);case FailTriggerRequestStatus():
return failTrigger(_that.failure);case FailRequestStatus():
return fail(_that.failure);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( Object? param)?  loading,TResult? Function( T? data)?  doneTrigger,TResult? Function( T? data)?  done,TResult? Function( T data)?  doneRequired,TResult? Function( Failure failure)?  failTrigger,TResult? Function( Failure failure)?  fail,}) {final _that = this;
switch (_that) {
case IdleRequestStatus() when idle != null:
return idle();case LoadingRequestStatus() when loading != null:
return loading(_that.param);case DoneTriggerRequestStatus() when doneTrigger != null:
return doneTrigger(_that.data);case DoneRequestStatus() when done != null:
return done(_that.data);case DoneRequiredRequestStatus() when doneRequired != null:
return doneRequired(_that.data);case FailTriggerRequestStatus() when failTrigger != null:
return failTrigger(_that.failure);case FailRequestStatus() when fail != null:
return fail(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class IdleRequestStatus<T extends Object> extends RequestStatus<T> {
  const IdleRequestStatus(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdleRequestStatus<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RequestStatus<$T>.idle()';
}


}




/// @nodoc


class LoadingRequestStatus<T extends Object> extends RequestStatus<T> {
  const LoadingRequestStatus([this.param]): super._();
  

 final  Object? param;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadingRequestStatusCopyWith<T, LoadingRequestStatus<T>> get copyWith => _$LoadingRequestStatusCopyWithImpl<T, LoadingRequestStatus<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingRequestStatus<T>&&const DeepCollectionEquality().equals(other.param, param));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(param));

@override
String toString() {
  return 'RequestStatus<$T>.loading(param: $param)';
}


}

/// @nodoc
abstract mixin class $LoadingRequestStatusCopyWith<T extends Object,$Res> implements $RequestStatusCopyWith<T, $Res> {
  factory $LoadingRequestStatusCopyWith(LoadingRequestStatus<T> value, $Res Function(LoadingRequestStatus<T>) _then) = _$LoadingRequestStatusCopyWithImpl;
@useResult
$Res call({
 Object? param
});




}
/// @nodoc
class _$LoadingRequestStatusCopyWithImpl<T extends Object,$Res>
    implements $LoadingRequestStatusCopyWith<T, $Res> {
  _$LoadingRequestStatusCopyWithImpl(this._self, this._then);

  final LoadingRequestStatus<T> _self;
  final $Res Function(LoadingRequestStatus<T>) _then;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? param = freezed,}) {
  return _then(LoadingRequestStatus<T>(
freezed == param ? _self.param : param ,
  ));
}


}

/// @nodoc


class DoneTriggerRequestStatus<T extends Object> extends RequestStatus<T> {
  const DoneTriggerRequestStatus([this.data]): super._();
  

 final  T? data;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoneTriggerRequestStatusCopyWith<T, DoneTriggerRequestStatus<T>> get copyWith => _$DoneTriggerRequestStatusCopyWithImpl<T, DoneTriggerRequestStatus<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoneTriggerRequestStatus<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'RequestStatus<$T>.doneTrigger(data: $data)';
}


}

/// @nodoc
abstract mixin class $DoneTriggerRequestStatusCopyWith<T extends Object,$Res> implements $RequestStatusCopyWith<T, $Res> {
  factory $DoneTriggerRequestStatusCopyWith(DoneTriggerRequestStatus<T> value, $Res Function(DoneTriggerRequestStatus<T>) _then) = _$DoneTriggerRequestStatusCopyWithImpl;
@useResult
$Res call({
 T? data
});




}
/// @nodoc
class _$DoneTriggerRequestStatusCopyWithImpl<T extends Object,$Res>
    implements $DoneTriggerRequestStatusCopyWith<T, $Res> {
  _$DoneTriggerRequestStatusCopyWithImpl(this._self, this._then);

  final DoneTriggerRequestStatus<T> _self;
  final $Res Function(DoneTriggerRequestStatus<T>) _then;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(DoneTriggerRequestStatus<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

/// @nodoc


class DoneRequestStatus<T extends Object> extends RequestStatus<T> {
  const DoneRequestStatus([this.data]): super._();
  

 final  T? data;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoneRequestStatusCopyWith<T, DoneRequestStatus<T>> get copyWith => _$DoneRequestStatusCopyWithImpl<T, DoneRequestStatus<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoneRequestStatus<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'RequestStatus<$T>.done(data: $data)';
}


}

/// @nodoc
abstract mixin class $DoneRequestStatusCopyWith<T extends Object,$Res> implements $RequestStatusCopyWith<T, $Res> {
  factory $DoneRequestStatusCopyWith(DoneRequestStatus<T> value, $Res Function(DoneRequestStatus<T>) _then) = _$DoneRequestStatusCopyWithImpl;
@useResult
$Res call({
 T? data
});




}
/// @nodoc
class _$DoneRequestStatusCopyWithImpl<T extends Object,$Res>
    implements $DoneRequestStatusCopyWith<T, $Res> {
  _$DoneRequestStatusCopyWithImpl(this._self, this._then);

  final DoneRequestStatus<T> _self;
  final $Res Function(DoneRequestStatus<T>) _then;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(DoneRequestStatus<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

/// @nodoc


class DoneRequiredRequestStatus<T extends Object> extends RequestStatus<T> {
  const DoneRequiredRequestStatus(this.data): super._();
  

 final  T data;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DoneRequiredRequestStatusCopyWith<T, DoneRequiredRequestStatus<T>> get copyWith => _$DoneRequiredRequestStatusCopyWithImpl<T, DoneRequiredRequestStatus<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DoneRequiredRequestStatus<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'RequestStatus<$T>.doneRequired(data: $data)';
}


}

/// @nodoc
abstract mixin class $DoneRequiredRequestStatusCopyWith<T extends Object,$Res> implements $RequestStatusCopyWith<T, $Res> {
  factory $DoneRequiredRequestStatusCopyWith(DoneRequiredRequestStatus<T> value, $Res Function(DoneRequiredRequestStatus<T>) _then) = _$DoneRequiredRequestStatusCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$DoneRequiredRequestStatusCopyWithImpl<T extends Object,$Res>
    implements $DoneRequiredRequestStatusCopyWith<T, $Res> {
  _$DoneRequiredRequestStatusCopyWithImpl(this._self, this._then);

  final DoneRequiredRequestStatus<T> _self;
  final $Res Function(DoneRequiredRequestStatus<T>) _then;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(DoneRequiredRequestStatus<T>(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class FailTriggerRequestStatus<T extends Object> extends RequestStatus<T> {
  const FailTriggerRequestStatus(this.failure): super._();
  

 final  Failure failure;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailTriggerRequestStatusCopyWith<T, FailTriggerRequestStatus<T>> get copyWith => _$FailTriggerRequestStatusCopyWithImpl<T, FailTriggerRequestStatus<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailTriggerRequestStatus<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'RequestStatus<$T>.failTrigger(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FailTriggerRequestStatusCopyWith<T extends Object,$Res> implements $RequestStatusCopyWith<T, $Res> {
  factory $FailTriggerRequestStatusCopyWith(FailTriggerRequestStatus<T> value, $Res Function(FailTriggerRequestStatus<T>) _then) = _$FailTriggerRequestStatusCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$FailTriggerRequestStatusCopyWithImpl<T extends Object,$Res>
    implements $FailTriggerRequestStatusCopyWith<T, $Res> {
  _$FailTriggerRequestStatusCopyWithImpl(this._self, this._then);

  final FailTriggerRequestStatus<T> _self;
  final $Res Function(FailTriggerRequestStatus<T>) _then;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(FailTriggerRequestStatus<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc


class FailRequestStatus<T extends Object> extends RequestStatus<T> {
  const FailRequestStatus(this.failure): super._();
  

 final  Failure failure;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailRequestStatusCopyWith<T, FailRequestStatus<T>> get copyWith => _$FailRequestStatusCopyWithImpl<T, FailRequestStatus<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailRequestStatus<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'RequestStatus<$T>.fail(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FailRequestStatusCopyWith<T extends Object,$Res> implements $RequestStatusCopyWith<T, $Res> {
  factory $FailRequestStatusCopyWith(FailRequestStatus<T> value, $Res Function(FailRequestStatus<T>) _then) = _$FailRequestStatusCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$FailRequestStatusCopyWithImpl<T extends Object,$Res>
    implements $FailRequestStatusCopyWith<T, $Res> {
  _$FailRequestStatusCopyWithImpl(this._self, this._then);

  final FailRequestStatus<T> _self;
  final $Res Function(FailRequestStatus<T>) _then;

/// Create a copy of RequestStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(FailRequestStatus<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
