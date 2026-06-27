// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_verify_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PinVerifyEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinVerifyEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinVerifyEvent()';
}


}

/// @nodoc
class $PinVerifyEventCopyWith<$Res>  {
$PinVerifyEventCopyWith(PinVerifyEvent _, $Res Function(PinVerifyEvent) __);
}


/// Adds pattern-matching-related methods to [PinVerifyEvent].
extension PinVerifyEventPatterns on PinVerifyEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _PinSubmitted value)?  pinSubmitted,TResult Function( _BiometricRequested value)?  biometricRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PinSubmitted() when pinSubmitted != null:
return pinSubmitted(_that);case _BiometricRequested() when biometricRequested != null:
return biometricRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _PinSubmitted value)  pinSubmitted,required TResult Function( _BiometricRequested value)  biometricRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _PinSubmitted():
return pinSubmitted(_that);case _BiometricRequested():
return biometricRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _PinSubmitted value)?  pinSubmitted,TResult? Function( _BiometricRequested value)?  biometricRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _PinSubmitted() when pinSubmitted != null:
return pinSubmitted(_that);case _BiometricRequested() when biometricRequested != null:
return biometricRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String pin)?  pinSubmitted,TResult Function()?  biometricRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PinSubmitted() when pinSubmitted != null:
return pinSubmitted(_that.pin);case _BiometricRequested() when biometricRequested != null:
return biometricRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String pin)  pinSubmitted,required TResult Function()  biometricRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _PinSubmitted():
return pinSubmitted(_that.pin);case _BiometricRequested():
return biometricRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String pin)?  pinSubmitted,TResult? Function()?  biometricRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _PinSubmitted() when pinSubmitted != null:
return pinSubmitted(_that.pin);case _BiometricRequested() when biometricRequested != null:
return biometricRequested();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements PinVerifyEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinVerifyEvent.started()';
}


}




/// @nodoc


class _PinSubmitted implements PinVerifyEvent {
  const _PinSubmitted(this.pin);
  

 final  String pin;

/// Create a copy of PinVerifyEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PinSubmittedCopyWith<_PinSubmitted> get copyWith => __$PinSubmittedCopyWithImpl<_PinSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PinSubmitted&&(identical(other.pin, pin) || other.pin == pin));
}


@override
int get hashCode => Object.hash(runtimeType,pin);

@override
String toString() {
  return 'PinVerifyEvent.pinSubmitted(pin: $pin)';
}


}

/// @nodoc
abstract mixin class _$PinSubmittedCopyWith<$Res> implements $PinVerifyEventCopyWith<$Res> {
  factory _$PinSubmittedCopyWith(_PinSubmitted value, $Res Function(_PinSubmitted) _then) = __$PinSubmittedCopyWithImpl;
@useResult
$Res call({
 String pin
});




}
/// @nodoc
class __$PinSubmittedCopyWithImpl<$Res>
    implements _$PinSubmittedCopyWith<$Res> {
  __$PinSubmittedCopyWithImpl(this._self, this._then);

  final _PinSubmitted _self;
  final $Res Function(_PinSubmitted) _then;

/// Create a copy of PinVerifyEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pin = null,}) {
  return _then(_PinSubmitted(
null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BiometricRequested implements PinVerifyEvent {
  const _BiometricRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiometricRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinVerifyEvent.biometricRequested()';
}


}




/// @nodoc
mixin _$PinVerifyState {

 bool get biometricEnabled; RequestStatus<int> get verify;
/// Create a copy of PinVerifyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PinVerifyStateCopyWith<PinVerifyState> get copyWith => _$PinVerifyStateCopyWithImpl<PinVerifyState>(this as PinVerifyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinVerifyState&&(identical(other.biometricEnabled, biometricEnabled) || other.biometricEnabled == biometricEnabled)&&(identical(other.verify, verify) || other.verify == verify));
}


@override
int get hashCode => Object.hash(runtimeType,biometricEnabled,verify);

@override
String toString() {
  return 'PinVerifyState(biometricEnabled: $biometricEnabled, verify: $verify)';
}


}

/// @nodoc
abstract mixin class $PinVerifyStateCopyWith<$Res>  {
  factory $PinVerifyStateCopyWith(PinVerifyState value, $Res Function(PinVerifyState) _then) = _$PinVerifyStateCopyWithImpl;
@useResult
$Res call({
 bool biometricEnabled, RequestStatus<int> verify
});


$RequestStatusCopyWith<int, $Res> get verify;

}
/// @nodoc
class _$PinVerifyStateCopyWithImpl<$Res>
    implements $PinVerifyStateCopyWith<$Res> {
  _$PinVerifyStateCopyWithImpl(this._self, this._then);

  final PinVerifyState _self;
  final $Res Function(PinVerifyState) _then;

/// Create a copy of PinVerifyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? biometricEnabled = null,Object? verify = null,}) {
  return _then(_self.copyWith(
biometricEnabled: null == biometricEnabled ? _self.biometricEnabled : biometricEnabled // ignore: cast_nullable_to_non_nullable
as bool,verify: null == verify ? _self.verify : verify // ignore: cast_nullable_to_non_nullable
as RequestStatus<int>,
  ));
}
/// Create a copy of PinVerifyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<int, $Res> get verify {
  
  return $RequestStatusCopyWith<int, $Res>(_self.verify, (value) {
    return _then(_self.copyWith(verify: value));
  });
}
}


/// Adds pattern-matching-related methods to [PinVerifyState].
extension PinVerifyStatePatterns on PinVerifyState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PinVerifyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PinVerifyState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PinVerifyState value)  $default,){
final _that = this;
switch (_that) {
case _PinVerifyState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PinVerifyState value)?  $default,){
final _that = this;
switch (_that) {
case _PinVerifyState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool biometricEnabled,  RequestStatus<int> verify)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PinVerifyState() when $default != null:
return $default(_that.biometricEnabled,_that.verify);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool biometricEnabled,  RequestStatus<int> verify)  $default,) {final _that = this;
switch (_that) {
case _PinVerifyState():
return $default(_that.biometricEnabled,_that.verify);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool biometricEnabled,  RequestStatus<int> verify)?  $default,) {final _that = this;
switch (_that) {
case _PinVerifyState() when $default != null:
return $default(_that.biometricEnabled,_that.verify);case _:
  return null;

}
}

}

/// @nodoc


class _PinVerifyState implements PinVerifyState {
  const _PinVerifyState({this.biometricEnabled = false, this.verify = const RequestStatus<int>.idle()});
  

@override@JsonKey() final  bool biometricEnabled;
@override@JsonKey() final  RequestStatus<int> verify;

/// Create a copy of PinVerifyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PinVerifyStateCopyWith<_PinVerifyState> get copyWith => __$PinVerifyStateCopyWithImpl<_PinVerifyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PinVerifyState&&(identical(other.biometricEnabled, biometricEnabled) || other.biometricEnabled == biometricEnabled)&&(identical(other.verify, verify) || other.verify == verify));
}


@override
int get hashCode => Object.hash(runtimeType,biometricEnabled,verify);

@override
String toString() {
  return 'PinVerifyState(biometricEnabled: $biometricEnabled, verify: $verify)';
}


}

/// @nodoc
abstract mixin class _$PinVerifyStateCopyWith<$Res> implements $PinVerifyStateCopyWith<$Res> {
  factory _$PinVerifyStateCopyWith(_PinVerifyState value, $Res Function(_PinVerifyState) _then) = __$PinVerifyStateCopyWithImpl;
@override @useResult
$Res call({
 bool biometricEnabled, RequestStatus<int> verify
});


@override $RequestStatusCopyWith<int, $Res> get verify;

}
/// @nodoc
class __$PinVerifyStateCopyWithImpl<$Res>
    implements _$PinVerifyStateCopyWith<$Res> {
  __$PinVerifyStateCopyWithImpl(this._self, this._then);

  final _PinVerifyState _self;
  final $Res Function(_PinVerifyState) _then;

/// Create a copy of PinVerifyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? biometricEnabled = null,Object? verify = null,}) {
  return _then(_PinVerifyState(
biometricEnabled: null == biometricEnabled ? _self.biometricEnabled : biometricEnabled // ignore: cast_nullable_to_non_nullable
as bool,verify: null == verify ? _self.verify : verify // ignore: cast_nullable_to_non_nullable
as RequestStatus<int>,
  ));
}

/// Create a copy of PinVerifyState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<int, $Res> get verify {
  
  return $RequestStatusCopyWith<int, $Res>(_self.verify, (value) {
    return _then(_self.copyWith(verify: value));
  });
}
}

// dart format on
