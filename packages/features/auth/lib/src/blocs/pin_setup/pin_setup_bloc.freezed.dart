// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pin_setup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PinSetupEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinSetupEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinSetupEvent()';
}


}

/// @nodoc
class $PinSetupEventCopyWith<$Res>  {
$PinSetupEventCopyWith(PinSetupEvent _, $Res Function(PinSetupEvent) __);
}


/// Adds pattern-matching-related methods to [PinSetupEvent].
extension PinSetupEventPatterns on PinSetupEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _PinSubmitted value)?  pinSubmitted,TResult Function( _BiometricDecided value)?  biometricDecided,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PinSubmitted() when pinSubmitted != null:
return pinSubmitted(_that);case _BiometricDecided() when biometricDecided != null:
return biometricDecided(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _PinSubmitted value)  pinSubmitted,required TResult Function( _BiometricDecided value)  biometricDecided,}){
final _that = this;
switch (_that) {
case _PinSubmitted():
return pinSubmitted(_that);case _BiometricDecided():
return biometricDecided(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _PinSubmitted value)?  pinSubmitted,TResult? Function( _BiometricDecided value)?  biometricDecided,}){
final _that = this;
switch (_that) {
case _PinSubmitted() when pinSubmitted != null:
return pinSubmitted(_that);case _BiometricDecided() when biometricDecided != null:
return biometricDecided(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String pin)?  pinSubmitted,TResult Function( bool enabled)?  biometricDecided,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PinSubmitted() when pinSubmitted != null:
return pinSubmitted(_that.pin);case _BiometricDecided() when biometricDecided != null:
return biometricDecided(_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String pin)  pinSubmitted,required TResult Function( bool enabled)  biometricDecided,}) {final _that = this;
switch (_that) {
case _PinSubmitted():
return pinSubmitted(_that.pin);case _BiometricDecided():
return biometricDecided(_that.enabled);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String pin)?  pinSubmitted,TResult? Function( bool enabled)?  biometricDecided,}) {final _that = this;
switch (_that) {
case _PinSubmitted() when pinSubmitted != null:
return pinSubmitted(_that.pin);case _BiometricDecided() when biometricDecided != null:
return biometricDecided(_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _PinSubmitted implements PinSetupEvent {
  const _PinSubmitted(this.pin);
  

 final  String pin;

/// Create a copy of PinSetupEvent
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
  return 'PinSetupEvent.pinSubmitted(pin: $pin)';
}


}

/// @nodoc
abstract mixin class _$PinSubmittedCopyWith<$Res> implements $PinSetupEventCopyWith<$Res> {
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

/// Create a copy of PinSetupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pin = null,}) {
  return _then(_PinSubmitted(
null == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BiometricDecided implements PinSetupEvent {
  const _BiometricDecided({required this.enabled});
  

 final  bool enabled;

/// Create a copy of PinSetupEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BiometricDecidedCopyWith<_BiometricDecided> get copyWith => __$BiometricDecidedCopyWithImpl<_BiometricDecided>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiometricDecided&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,enabled);

@override
String toString() {
  return 'PinSetupEvent.biometricDecided(enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$BiometricDecidedCopyWith<$Res> implements $PinSetupEventCopyWith<$Res> {
  factory _$BiometricDecidedCopyWith(_BiometricDecided value, $Res Function(_BiometricDecided) _then) = __$BiometricDecidedCopyWithImpl;
@useResult
$Res call({
 bool enabled
});




}
/// @nodoc
class __$BiometricDecidedCopyWithImpl<$Res>
    implements _$BiometricDecidedCopyWith<$Res> {
  __$BiometricDecidedCopyWithImpl(this._self, this._then);

  final _BiometricDecided _self;
  final $Res Function(_BiometricDecided) _then;

/// Create a copy of PinSetupEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? enabled = null,}) {
  return _then(_BiometricDecided(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$PinSetupState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PinSetupState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinSetupState()';
}


}

/// @nodoc
class $PinSetupStateCopyWith<$Res>  {
$PinSetupStateCopyWith(PinSetupState _, $Res Function(PinSetupState) __);
}


/// Adds pattern-matching-related methods to [PinSetupState].
extension PinSetupStatePatterns on PinSetupState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AwaitingFirst value)?  awaitingFirst,TResult Function( _AwaitingConfirmation value)?  awaitingConfirmation,TResult Function( _Mismatch value)?  mismatch,TResult Function( _BiometricPrompt value)?  biometricPrompt,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AwaitingFirst() when awaitingFirst != null:
return awaitingFirst(_that);case _AwaitingConfirmation() when awaitingConfirmation != null:
return awaitingConfirmation(_that);case _Mismatch() when mismatch != null:
return mismatch(_that);case _BiometricPrompt() when biometricPrompt != null:
return biometricPrompt(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AwaitingFirst value)  awaitingFirst,required TResult Function( _AwaitingConfirmation value)  awaitingConfirmation,required TResult Function( _Mismatch value)  mismatch,required TResult Function( _BiometricPrompt value)  biometricPrompt,}){
final _that = this;
switch (_that) {
case _AwaitingFirst():
return awaitingFirst(_that);case _AwaitingConfirmation():
return awaitingConfirmation(_that);case _Mismatch():
return mismatch(_that);case _BiometricPrompt():
return biometricPrompt(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AwaitingFirst value)?  awaitingFirst,TResult? Function( _AwaitingConfirmation value)?  awaitingConfirmation,TResult? Function( _Mismatch value)?  mismatch,TResult? Function( _BiometricPrompt value)?  biometricPrompt,}){
final _that = this;
switch (_that) {
case _AwaitingFirst() when awaitingFirst != null:
return awaitingFirst(_that);case _AwaitingConfirmation() when awaitingConfirmation != null:
return awaitingConfirmation(_that);case _Mismatch() when mismatch != null:
return mismatch(_that);case _BiometricPrompt() when biometricPrompt != null:
return biometricPrompt(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  awaitingFirst,TResult Function()?  awaitingConfirmation,TResult Function()?  mismatch,TResult Function()?  biometricPrompt,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AwaitingFirst() when awaitingFirst != null:
return awaitingFirst();case _AwaitingConfirmation() when awaitingConfirmation != null:
return awaitingConfirmation();case _Mismatch() when mismatch != null:
return mismatch();case _BiometricPrompt() when biometricPrompt != null:
return biometricPrompt();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  awaitingFirst,required TResult Function()  awaitingConfirmation,required TResult Function()  mismatch,required TResult Function()  biometricPrompt,}) {final _that = this;
switch (_that) {
case _AwaitingFirst():
return awaitingFirst();case _AwaitingConfirmation():
return awaitingConfirmation();case _Mismatch():
return mismatch();case _BiometricPrompt():
return biometricPrompt();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  awaitingFirst,TResult? Function()?  awaitingConfirmation,TResult? Function()?  mismatch,TResult? Function()?  biometricPrompt,}) {final _that = this;
switch (_that) {
case _AwaitingFirst() when awaitingFirst != null:
return awaitingFirst();case _AwaitingConfirmation() when awaitingConfirmation != null:
return awaitingConfirmation();case _Mismatch() when mismatch != null:
return mismatch();case _BiometricPrompt() when biometricPrompt != null:
return biometricPrompt();case _:
  return null;

}
}

}

/// @nodoc


class _AwaitingFirst implements PinSetupState {
  const _AwaitingFirst();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AwaitingFirst);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinSetupState.awaitingFirst()';
}


}




/// @nodoc


class _AwaitingConfirmation implements PinSetupState {
  const _AwaitingConfirmation();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AwaitingConfirmation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinSetupState.awaitingConfirmation()';
}


}




/// @nodoc


class _Mismatch implements PinSetupState {
  const _Mismatch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Mismatch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinSetupState.mismatch()';
}


}




/// @nodoc


class _BiometricPrompt implements PinSetupState {
  const _BiometricPrompt();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BiometricPrompt);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PinSetupState.biometricPrompt()';
}


}




// dart format on
