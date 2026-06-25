// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthStatusEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStatusEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthStatusEvent()';
}


}

/// @nodoc
class $AuthStatusEventCopyWith<$Res>  {
$AuthStatusEventCopyWith(AuthStatusEvent _, $Res Function(AuthStatusEvent) __);
}


/// Adds pattern-matching-related methods to [AuthStatusEvent].
extension AuthStatusEventPatterns on AuthStatusEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthStatusRestored value)?  restored,TResult Function( _AuthLockedStatusSet value)?  lockedStatusSet,TResult Function( _AuthStatusChanged value)?  changed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthStatusRestored() when restored != null:
return restored(_that);case _AuthLockedStatusSet() when lockedStatusSet != null:
return lockedStatusSet(_that);case _AuthStatusChanged() when changed != null:
return changed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthStatusRestored value)  restored,required TResult Function( _AuthLockedStatusSet value)  lockedStatusSet,required TResult Function( _AuthStatusChanged value)  changed,}){
final _that = this;
switch (_that) {
case _AuthStatusRestored():
return restored(_that);case _AuthLockedStatusSet():
return lockedStatusSet(_that);case _AuthStatusChanged():
return changed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthStatusRestored value)?  restored,TResult? Function( _AuthLockedStatusSet value)?  lockedStatusSet,TResult? Function( _AuthStatusChanged value)?  changed,}){
final _that = this;
switch (_that) {
case _AuthStatusRestored() when restored != null:
return restored(_that);case _AuthLockedStatusSet() when lockedStatusSet != null:
return lockedStatusSet(_that);case _AuthStatusChanged() when changed != null:
return changed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  restored,TResult Function( UserLockedStatus status)?  lockedStatusSet,TResult Function( UserAuthInfo info)?  changed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthStatusRestored() when restored != null:
return restored();case _AuthLockedStatusSet() when lockedStatusSet != null:
return lockedStatusSet(_that.status);case _AuthStatusChanged() when changed != null:
return changed(_that.info);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  restored,required TResult Function( UserLockedStatus status)  lockedStatusSet,required TResult Function( UserAuthInfo info)  changed,}) {final _that = this;
switch (_that) {
case _AuthStatusRestored():
return restored();case _AuthLockedStatusSet():
return lockedStatusSet(_that.status);case _AuthStatusChanged():
return changed(_that.info);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  restored,TResult? Function( UserLockedStatus status)?  lockedStatusSet,TResult? Function( UserAuthInfo info)?  changed,}) {final _that = this;
switch (_that) {
case _AuthStatusRestored() when restored != null:
return restored();case _AuthLockedStatusSet() when lockedStatusSet != null:
return lockedStatusSet(_that.status);case _AuthStatusChanged() when changed != null:
return changed(_that.info);case _:
  return null;

}
}

}

/// @nodoc


class _AuthStatusRestored implements AuthStatusEvent {
  const _AuthStatusRestored();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusRestored);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthStatusEvent.restored()';
}


}




/// @nodoc


class _AuthLockedStatusSet implements AuthStatusEvent {
  const _AuthLockedStatusSet(this.status);
  

 final  UserLockedStatus status;

/// Create a copy of AuthStatusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthLockedStatusSetCopyWith<_AuthLockedStatusSet> get copyWith => __$AuthLockedStatusSetCopyWithImpl<_AuthLockedStatusSet>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthLockedStatusSet&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'AuthStatusEvent.lockedStatusSet(status: $status)';
}


}

/// @nodoc
abstract mixin class _$AuthLockedStatusSetCopyWith<$Res> implements $AuthStatusEventCopyWith<$Res> {
  factory _$AuthLockedStatusSetCopyWith(_AuthLockedStatusSet value, $Res Function(_AuthLockedStatusSet) _then) = __$AuthLockedStatusSetCopyWithImpl;
@useResult
$Res call({
 UserLockedStatus status
});




}
/// @nodoc
class __$AuthLockedStatusSetCopyWithImpl<$Res>
    implements _$AuthLockedStatusSetCopyWith<$Res> {
  __$AuthLockedStatusSetCopyWithImpl(this._self, this._then);

  final _AuthLockedStatusSet _self;
  final $Res Function(_AuthLockedStatusSet) _then;

/// Create a copy of AuthStatusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_AuthLockedStatusSet(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserLockedStatus,
  ));
}


}

/// @nodoc


class _AuthStatusChanged implements AuthStatusEvent {
  const _AuthStatusChanged(this.info);
  

 final  UserAuthInfo info;

/// Create a copy of AuthStatusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStatusChangedCopyWith<_AuthStatusChanged> get copyWith => __$AuthStatusChangedCopyWithImpl<_AuthStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusChanged&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'AuthStatusEvent.changed(info: $info)';
}


}

/// @nodoc
abstract mixin class _$AuthStatusChangedCopyWith<$Res> implements $AuthStatusEventCopyWith<$Res> {
  factory _$AuthStatusChangedCopyWith(_AuthStatusChanged value, $Res Function(_AuthStatusChanged) _then) = __$AuthStatusChangedCopyWithImpl;
@useResult
$Res call({
 UserAuthInfo info
});




}
/// @nodoc
class __$AuthStatusChangedCopyWithImpl<$Res>
    implements _$AuthStatusChangedCopyWith<$Res> {
  __$AuthStatusChangedCopyWithImpl(this._self, this._then);

  final _AuthStatusChanged _self;
  final $Res Function(_AuthStatusChanged) _then;

/// Create a copy of AuthStatusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,}) {
  return _then(_AuthStatusChanged(
null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as UserAuthInfo,
  ));
}


}

/// @nodoc
mixin _$AuthStatusState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStatusState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthStatusState()';
}


}

/// @nodoc
class $AuthStatusStateCopyWith<$Res>  {
$AuthStatusStateCopyWith(AuthStatusState _, $Res Function(AuthStatusState) __);
}


/// Adds pattern-matching-related methods to [AuthStatusState].
extension AuthStatusStatePatterns on AuthStatusState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthStatusRestoring value)?  restoring,TResult Function( _AuthStatusAuthenticated value)?  authenticated,TResult Function( _AuthStatusUnauthenticated value)?  unauthenticated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthStatusRestoring() when restoring != null:
return restoring(_that);case _AuthStatusAuthenticated() when authenticated != null:
return authenticated(_that);case _AuthStatusUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthStatusRestoring value)  restoring,required TResult Function( _AuthStatusAuthenticated value)  authenticated,required TResult Function( _AuthStatusUnauthenticated value)  unauthenticated,}){
final _that = this;
switch (_that) {
case _AuthStatusRestoring():
return restoring(_that);case _AuthStatusAuthenticated():
return authenticated(_that);case _AuthStatusUnauthenticated():
return unauthenticated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthStatusRestoring value)?  restoring,TResult? Function( _AuthStatusAuthenticated value)?  authenticated,TResult? Function( _AuthStatusUnauthenticated value)?  unauthenticated,}){
final _that = this;
switch (_that) {
case _AuthStatusRestoring() when restoring != null:
return restoring(_that);case _AuthStatusAuthenticated() when authenticated != null:
return authenticated(_that);case _AuthStatusUnauthenticated() when unauthenticated != null:
return unauthenticated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  restoring,TResult Function( UserAuthInfo info)?  authenticated,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthStatusRestoring() when restoring != null:
return restoring();case _AuthStatusAuthenticated() when authenticated != null:
return authenticated(_that.info);case _AuthStatusUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  restoring,required TResult Function( UserAuthInfo info)  authenticated,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case _AuthStatusRestoring():
return restoring();case _AuthStatusAuthenticated():
return authenticated(_that.info);case _AuthStatusUnauthenticated():
return unauthenticated();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  restoring,TResult? Function( UserAuthInfo info)?  authenticated,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case _AuthStatusRestoring() when restoring != null:
return restoring();case _AuthStatusAuthenticated() when authenticated != null:
return authenticated(_that.info);case _AuthStatusUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class _AuthStatusRestoring extends AuthStatusState {
  const _AuthStatusRestoring(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusRestoring);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthStatusState.restoring()';
}


}




/// @nodoc


class _AuthStatusAuthenticated extends AuthStatusState {
  const _AuthStatusAuthenticated(this.info): super._();
  

 final  UserAuthInfo info;

/// Create a copy of AuthStatusState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStatusAuthenticatedCopyWith<_AuthStatusAuthenticated> get copyWith => __$AuthStatusAuthenticatedCopyWithImpl<_AuthStatusAuthenticated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusAuthenticated&&(identical(other.info, info) || other.info == info));
}


@override
int get hashCode => Object.hash(runtimeType,info);

@override
String toString() {
  return 'AuthStatusState.authenticated(info: $info)';
}


}

/// @nodoc
abstract mixin class _$AuthStatusAuthenticatedCopyWith<$Res> implements $AuthStatusStateCopyWith<$Res> {
  factory _$AuthStatusAuthenticatedCopyWith(_AuthStatusAuthenticated value, $Res Function(_AuthStatusAuthenticated) _then) = __$AuthStatusAuthenticatedCopyWithImpl;
@useResult
$Res call({
 UserAuthInfo info
});




}
/// @nodoc
class __$AuthStatusAuthenticatedCopyWithImpl<$Res>
    implements _$AuthStatusAuthenticatedCopyWith<$Res> {
  __$AuthStatusAuthenticatedCopyWithImpl(this._self, this._then);

  final _AuthStatusAuthenticated _self;
  final $Res Function(_AuthStatusAuthenticated) _then;

/// Create a copy of AuthStatusState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? info = null,}) {
  return _then(_AuthStatusAuthenticated(
null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as UserAuthInfo,
  ));
}


}

/// @nodoc


class _AuthStatusUnauthenticated extends AuthStatusState {
  const _AuthStatusUnauthenticated(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusUnauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthStatusState.unauthenticated()';
}


}




// dart format on
