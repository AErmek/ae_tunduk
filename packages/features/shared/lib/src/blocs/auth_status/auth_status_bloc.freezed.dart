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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthStatusStarted value)?  started,TResult Function( _AuthStatusLoggedOut value)?  loggedOut,TResult Function( _AuthStatusChanged value)?  changed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthStatusStarted() when started != null:
return started(_that);case _AuthStatusLoggedOut() when loggedOut != null:
return loggedOut(_that);case _AuthStatusChanged() when changed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthStatusStarted value)  started,required TResult Function( _AuthStatusLoggedOut value)  loggedOut,required TResult Function( _AuthStatusChanged value)  changed,}){
final _that = this;
switch (_that) {
case _AuthStatusStarted():
return started(_that);case _AuthStatusLoggedOut():
return loggedOut(_that);case _AuthStatusChanged():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthStatusStarted value)?  started,TResult? Function( _AuthStatusLoggedOut value)?  loggedOut,TResult? Function( _AuthStatusChanged value)?  changed,}){
final _that = this;
switch (_that) {
case _AuthStatusStarted() when started != null:
return started(_that);case _AuthStatusLoggedOut() when loggedOut != null:
return loggedOut(_that);case _AuthStatusChanged() when changed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  loggedOut,TResult Function( AuthStatus status)?  changed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthStatusStarted() when started != null:
return started();case _AuthStatusLoggedOut() when loggedOut != null:
return loggedOut();case _AuthStatusChanged() when changed != null:
return changed(_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  loggedOut,required TResult Function( AuthStatus status)  changed,}) {final _that = this;
switch (_that) {
case _AuthStatusStarted():
return started();case _AuthStatusLoggedOut():
return loggedOut();case _AuthStatusChanged():
return changed(_that.status);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  loggedOut,TResult? Function( AuthStatus status)?  changed,}) {final _that = this;
switch (_that) {
case _AuthStatusStarted() when started != null:
return started();case _AuthStatusLoggedOut() when loggedOut != null:
return loggedOut();case _AuthStatusChanged() when changed != null:
return changed(_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _AuthStatusStarted implements AuthStatusEvent {
  const _AuthStatusStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthStatusEvent.started()';
}


}




/// @nodoc


class _AuthStatusLoggedOut implements AuthStatusEvent {
  const _AuthStatusLoggedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusLoggedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthStatusEvent.loggedOut()';
}


}




/// @nodoc


class _AuthStatusChanged implements AuthStatusEvent {
  const _AuthStatusChanged(this.status);
  

 final  AuthStatus status;

/// Create a copy of AuthStatusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStatusChangedCopyWith<_AuthStatusChanged> get copyWith => __$AuthStatusChangedCopyWithImpl<_AuthStatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusChanged&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'AuthStatusEvent.changed(status: $status)';
}


}

/// @nodoc
abstract mixin class _$AuthStatusChangedCopyWith<$Res> implements $AuthStatusEventCopyWith<$Res> {
  factory _$AuthStatusChangedCopyWith(_AuthStatusChanged value, $Res Function(_AuthStatusChanged) _then) = __$AuthStatusChangedCopyWithImpl;
@useResult
$Res call({
 AuthStatus status
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
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_AuthStatusChanged(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  restoring,TResult Function()?  authenticated,TResult Function()?  unauthenticated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthStatusRestoring() when restoring != null:
return restoring();case _AuthStatusAuthenticated() when authenticated != null:
return authenticated();case _AuthStatusUnauthenticated() when unauthenticated != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  restoring,required TResult Function()  authenticated,required TResult Function()  unauthenticated,}) {final _that = this;
switch (_that) {
case _AuthStatusRestoring():
return restoring();case _AuthStatusAuthenticated():
return authenticated();case _AuthStatusUnauthenticated():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  restoring,TResult? Function()?  authenticated,TResult? Function()?  unauthenticated,}) {final _that = this;
switch (_that) {
case _AuthStatusRestoring() when restoring != null:
return restoring();case _AuthStatusAuthenticated() when authenticated != null:
return authenticated();case _AuthStatusUnauthenticated() when unauthenticated != null:
return unauthenticated();case _:
  return null;

}
}

}

/// @nodoc


class _AuthStatusRestoring implements AuthStatusState {
  const _AuthStatusRestoring();
  






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


class _AuthStatusAuthenticated implements AuthStatusState {
  const _AuthStatusAuthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStatusAuthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthStatusState.authenticated()';
}


}




/// @nodoc


class _AuthStatusUnauthenticated implements AuthStatusState {
  const _AuthStatusUnauthenticated();
  






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
