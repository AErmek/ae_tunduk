// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidate_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CandidateDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidateDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CandidateDetailEvent()';
}


}

/// @nodoc
class $CandidateDetailEventCopyWith<$Res>  {
$CandidateDetailEventCopyWith(CandidateDetailEvent _, $Res Function(CandidateDetailEvent) __);
}


/// Adds pattern-matching-related methods to [CandidateDetailEvent].
extension CandidateDetailEventPatterns on CandidateDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _CandidateUpdated value)?  candidateUpdated,TResult Function( _StatusChanged value)?  statusChanged,TResult Function( _NoteSubmitted value)?  noteSubmitted,TResult Function( _PendingChanged value)?  pendingChanged,TResult Function( _OnlineChanged value)?  onlineChanged,TResult Function( _ShareRequested value)?  shareRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CandidateUpdated() when candidateUpdated != null:
return candidateUpdated(_that);case _StatusChanged() when statusChanged != null:
return statusChanged(_that);case _NoteSubmitted() when noteSubmitted != null:
return noteSubmitted(_that);case _PendingChanged() when pendingChanged != null:
return pendingChanged(_that);case _OnlineChanged() when onlineChanged != null:
return onlineChanged(_that);case _ShareRequested() when shareRequested != null:
return shareRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _CandidateUpdated value)  candidateUpdated,required TResult Function( _StatusChanged value)  statusChanged,required TResult Function( _NoteSubmitted value)  noteSubmitted,required TResult Function( _PendingChanged value)  pendingChanged,required TResult Function( _OnlineChanged value)  onlineChanged,required TResult Function( _ShareRequested value)  shareRequested,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _CandidateUpdated():
return candidateUpdated(_that);case _StatusChanged():
return statusChanged(_that);case _NoteSubmitted():
return noteSubmitted(_that);case _PendingChanged():
return pendingChanged(_that);case _OnlineChanged():
return onlineChanged(_that);case _ShareRequested():
return shareRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _CandidateUpdated value)?  candidateUpdated,TResult? Function( _StatusChanged value)?  statusChanged,TResult? Function( _NoteSubmitted value)?  noteSubmitted,TResult? Function( _PendingChanged value)?  pendingChanged,TResult? Function( _OnlineChanged value)?  onlineChanged,TResult? Function( _ShareRequested value)?  shareRequested,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _CandidateUpdated() when candidateUpdated != null:
return candidateUpdated(_that);case _StatusChanged() when statusChanged != null:
return statusChanged(_that);case _NoteSubmitted() when noteSubmitted != null:
return noteSubmitted(_that);case _PendingChanged() when pendingChanged != null:
return pendingChanged(_that);case _OnlineChanged() when onlineChanged != null:
return onlineChanged(_that);case _ShareRequested() when shareRequested != null:
return shareRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( Candidate? candidate)?  candidateUpdated,TResult Function( CandidateStatus status)?  statusChanged,TResult Function( String note)?  noteSubmitted,TResult Function( bool hasPending)?  pendingChanged,TResult Function( bool isOnline)?  onlineChanged,TResult Function()?  shareRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CandidateUpdated() when candidateUpdated != null:
return candidateUpdated(_that.candidate);case _StatusChanged() when statusChanged != null:
return statusChanged(_that.status);case _NoteSubmitted() when noteSubmitted != null:
return noteSubmitted(_that.note);case _PendingChanged() when pendingChanged != null:
return pendingChanged(_that.hasPending);case _OnlineChanged() when onlineChanged != null:
return onlineChanged(_that.isOnline);case _ShareRequested() when shareRequested != null:
return shareRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( Candidate? candidate)  candidateUpdated,required TResult Function( CandidateStatus status)  statusChanged,required TResult Function( String note)  noteSubmitted,required TResult Function( bool hasPending)  pendingChanged,required TResult Function( bool isOnline)  onlineChanged,required TResult Function()  shareRequested,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _CandidateUpdated():
return candidateUpdated(_that.candidate);case _StatusChanged():
return statusChanged(_that.status);case _NoteSubmitted():
return noteSubmitted(_that.note);case _PendingChanged():
return pendingChanged(_that.hasPending);case _OnlineChanged():
return onlineChanged(_that.isOnline);case _ShareRequested():
return shareRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( Candidate? candidate)?  candidateUpdated,TResult? Function( CandidateStatus status)?  statusChanged,TResult? Function( String note)?  noteSubmitted,TResult? Function( bool hasPending)?  pendingChanged,TResult? Function( bool isOnline)?  onlineChanged,TResult? Function()?  shareRequested,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _CandidateUpdated() when candidateUpdated != null:
return candidateUpdated(_that.candidate);case _StatusChanged() when statusChanged != null:
return statusChanged(_that.status);case _NoteSubmitted() when noteSubmitted != null:
return noteSubmitted(_that.note);case _PendingChanged() when pendingChanged != null:
return pendingChanged(_that.hasPending);case _OnlineChanged() when onlineChanged != null:
return onlineChanged(_that.isOnline);case _ShareRequested() when shareRequested != null:
return shareRequested();case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CandidateDetailEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CandidateDetailEvent.started()';
}


}




/// @nodoc


class _CandidateUpdated implements CandidateDetailEvent {
  const _CandidateUpdated(this.candidate);
  

 final  Candidate? candidate;

/// Create a copy of CandidateDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidateUpdatedCopyWith<_CandidateUpdated> get copyWith => __$CandidateUpdatedCopyWithImpl<_CandidateUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidateUpdated&&(identical(other.candidate, candidate) || other.candidate == candidate));
}


@override
int get hashCode => Object.hash(runtimeType,candidate);

@override
String toString() {
  return 'CandidateDetailEvent.candidateUpdated(candidate: $candidate)';
}


}

/// @nodoc
abstract mixin class _$CandidateUpdatedCopyWith<$Res> implements $CandidateDetailEventCopyWith<$Res> {
  factory _$CandidateUpdatedCopyWith(_CandidateUpdated value, $Res Function(_CandidateUpdated) _then) = __$CandidateUpdatedCopyWithImpl;
@useResult
$Res call({
 Candidate? candidate
});




}
/// @nodoc
class __$CandidateUpdatedCopyWithImpl<$Res>
    implements _$CandidateUpdatedCopyWith<$Res> {
  __$CandidateUpdatedCopyWithImpl(this._self, this._then);

  final _CandidateUpdated _self;
  final $Res Function(_CandidateUpdated) _then;

/// Create a copy of CandidateDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? candidate = freezed,}) {
  return _then(_CandidateUpdated(
freezed == candidate ? _self.candidate : candidate // ignore: cast_nullable_to_non_nullable
as Candidate?,
  ));
}


}

/// @nodoc


class _StatusChanged implements CandidateDetailEvent {
  const _StatusChanged(this.status);
  

 final  CandidateStatus status;

/// Create a copy of CandidateDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusChangedCopyWith<_StatusChanged> get copyWith => __$StatusChangedCopyWithImpl<_StatusChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusChanged&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'CandidateDetailEvent.statusChanged(status: $status)';
}


}

/// @nodoc
abstract mixin class _$StatusChangedCopyWith<$Res> implements $CandidateDetailEventCopyWith<$Res> {
  factory _$StatusChangedCopyWith(_StatusChanged value, $Res Function(_StatusChanged) _then) = __$StatusChangedCopyWithImpl;
@useResult
$Res call({
 CandidateStatus status
});




}
/// @nodoc
class __$StatusChangedCopyWithImpl<$Res>
    implements _$StatusChangedCopyWith<$Res> {
  __$StatusChangedCopyWithImpl(this._self, this._then);

  final _StatusChanged _self;
  final $Res Function(_StatusChanged) _then;

/// Create a copy of CandidateDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = null,}) {
  return _then(_StatusChanged(
null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CandidateStatus,
  ));
}


}

/// @nodoc


class _NoteSubmitted implements CandidateDetailEvent {
  const _NoteSubmitted(this.note);
  

 final  String note;

/// Create a copy of CandidateDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteSubmittedCopyWith<_NoteSubmitted> get copyWith => __$NoteSubmittedCopyWithImpl<_NoteSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteSubmitted&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'CandidateDetailEvent.noteSubmitted(note: $note)';
}


}

/// @nodoc
abstract mixin class _$NoteSubmittedCopyWith<$Res> implements $CandidateDetailEventCopyWith<$Res> {
  factory _$NoteSubmittedCopyWith(_NoteSubmitted value, $Res Function(_NoteSubmitted) _then) = __$NoteSubmittedCopyWithImpl;
@useResult
$Res call({
 String note
});




}
/// @nodoc
class __$NoteSubmittedCopyWithImpl<$Res>
    implements _$NoteSubmittedCopyWith<$Res> {
  __$NoteSubmittedCopyWithImpl(this._self, this._then);

  final _NoteSubmitted _self;
  final $Res Function(_NoteSubmitted) _then;

/// Create a copy of CandidateDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(_NoteSubmitted(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _PendingChanged implements CandidateDetailEvent {
  const _PendingChanged(this.hasPending);
  

 final  bool hasPending;

/// Create a copy of CandidateDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingChangedCopyWith<_PendingChanged> get copyWith => __$PendingChangedCopyWithImpl<_PendingChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingChanged&&(identical(other.hasPending, hasPending) || other.hasPending == hasPending));
}


@override
int get hashCode => Object.hash(runtimeType,hasPending);

@override
String toString() {
  return 'CandidateDetailEvent.pendingChanged(hasPending: $hasPending)';
}


}

/// @nodoc
abstract mixin class _$PendingChangedCopyWith<$Res> implements $CandidateDetailEventCopyWith<$Res> {
  factory _$PendingChangedCopyWith(_PendingChanged value, $Res Function(_PendingChanged) _then) = __$PendingChangedCopyWithImpl;
@useResult
$Res call({
 bool hasPending
});




}
/// @nodoc
class __$PendingChangedCopyWithImpl<$Res>
    implements _$PendingChangedCopyWith<$Res> {
  __$PendingChangedCopyWithImpl(this._self, this._then);

  final _PendingChanged _self;
  final $Res Function(_PendingChanged) _then;

/// Create a copy of CandidateDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? hasPending = null,}) {
  return _then(_PendingChanged(
null == hasPending ? _self.hasPending : hasPending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _OnlineChanged implements CandidateDetailEvent {
  const _OnlineChanged(this.isOnline);
  

 final  bool isOnline;

/// Create a copy of CandidateDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnlineChangedCopyWith<_OnlineChanged> get copyWith => __$OnlineChangedCopyWithImpl<_OnlineChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnlineChanged&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}


@override
int get hashCode => Object.hash(runtimeType,isOnline);

@override
String toString() {
  return 'CandidateDetailEvent.onlineChanged(isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class _$OnlineChangedCopyWith<$Res> implements $CandidateDetailEventCopyWith<$Res> {
  factory _$OnlineChangedCopyWith(_OnlineChanged value, $Res Function(_OnlineChanged) _then) = __$OnlineChangedCopyWithImpl;
@useResult
$Res call({
 bool isOnline
});




}
/// @nodoc
class __$OnlineChangedCopyWithImpl<$Res>
    implements _$OnlineChangedCopyWith<$Res> {
  __$OnlineChangedCopyWithImpl(this._self, this._then);

  final _OnlineChanged _self;
  final $Res Function(_OnlineChanged) _then;

/// Create a copy of CandidateDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isOnline = null,}) {
  return _then(_OnlineChanged(
null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _ShareRequested implements CandidateDetailEvent {
  const _ShareRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CandidateDetailEvent.shareRequested()';
}


}




/// @nodoc
mixin _$CandidateDetailState {

 Candidate? get candidate; RequestStatus<int> get load; RequestStatus<int> get save; bool get isOnline; bool get hasPending; RequestStatus<String> get share;
/// Create a copy of CandidateDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidateDetailStateCopyWith<CandidateDetailState> get copyWith => _$CandidateDetailStateCopyWithImpl<CandidateDetailState>(this as CandidateDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidateDetailState&&(identical(other.candidate, candidate) || other.candidate == candidate)&&(identical(other.load, load) || other.load == load)&&(identical(other.save, save) || other.save == save)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.hasPending, hasPending) || other.hasPending == hasPending)&&(identical(other.share, share) || other.share == share));
}


@override
int get hashCode => Object.hash(runtimeType,candidate,load,save,isOnline,hasPending,share);

@override
String toString() {
  return 'CandidateDetailState(candidate: $candidate, load: $load, save: $save, isOnline: $isOnline, hasPending: $hasPending, share: $share)';
}


}

/// @nodoc
abstract mixin class $CandidateDetailStateCopyWith<$Res>  {
  factory $CandidateDetailStateCopyWith(CandidateDetailState value, $Res Function(CandidateDetailState) _then) = _$CandidateDetailStateCopyWithImpl;
@useResult
$Res call({
 Candidate? candidate, RequestStatus<int> load, RequestStatus<int> save, bool isOnline, bool hasPending, RequestStatus<String> share
});


$RequestStatusCopyWith<int, $Res> get load;$RequestStatusCopyWith<int, $Res> get save;$RequestStatusCopyWith<String, $Res> get share;

}
/// @nodoc
class _$CandidateDetailStateCopyWithImpl<$Res>
    implements $CandidateDetailStateCopyWith<$Res> {
  _$CandidateDetailStateCopyWithImpl(this._self, this._then);

  final CandidateDetailState _self;
  final $Res Function(CandidateDetailState) _then;

/// Create a copy of CandidateDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? candidate = freezed,Object? load = null,Object? save = null,Object? isOnline = null,Object? hasPending = null,Object? share = null,}) {
  return _then(_self.copyWith(
candidate: freezed == candidate ? _self.candidate : candidate // ignore: cast_nullable_to_non_nullable
as Candidate?,load: null == load ? _self.load : load // ignore: cast_nullable_to_non_nullable
as RequestStatus<int>,save: null == save ? _self.save : save // ignore: cast_nullable_to_non_nullable
as RequestStatus<int>,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,hasPending: null == hasPending ? _self.hasPending : hasPending // ignore: cast_nullable_to_non_nullable
as bool,share: null == share ? _self.share : share // ignore: cast_nullable_to_non_nullable
as RequestStatus<String>,
  ));
}
/// Create a copy of CandidateDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<int, $Res> get load {
  
  return $RequestStatusCopyWith<int, $Res>(_self.load, (value) {
    return _then(_self.copyWith(load: value));
  });
}/// Create a copy of CandidateDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<int, $Res> get save {
  
  return $RequestStatusCopyWith<int, $Res>(_self.save, (value) {
    return _then(_self.copyWith(save: value));
  });
}/// Create a copy of CandidateDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<String, $Res> get share {
  
  return $RequestStatusCopyWith<String, $Res>(_self.share, (value) {
    return _then(_self.copyWith(share: value));
  });
}
}


/// Adds pattern-matching-related methods to [CandidateDetailState].
extension CandidateDetailStatePatterns on CandidateDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CandidateDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CandidateDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CandidateDetailState value)  $default,){
final _that = this;
switch (_that) {
case _CandidateDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CandidateDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _CandidateDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Candidate? candidate,  RequestStatus<int> load,  RequestStatus<int> save,  bool isOnline,  bool hasPending,  RequestStatus<String> share)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandidateDetailState() when $default != null:
return $default(_that.candidate,_that.load,_that.save,_that.isOnline,_that.hasPending,_that.share);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Candidate? candidate,  RequestStatus<int> load,  RequestStatus<int> save,  bool isOnline,  bool hasPending,  RequestStatus<String> share)  $default,) {final _that = this;
switch (_that) {
case _CandidateDetailState():
return $default(_that.candidate,_that.load,_that.save,_that.isOnline,_that.hasPending,_that.share);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Candidate? candidate,  RequestStatus<int> load,  RequestStatus<int> save,  bool isOnline,  bool hasPending,  RequestStatus<String> share)?  $default,) {final _that = this;
switch (_that) {
case _CandidateDetailState() when $default != null:
return $default(_that.candidate,_that.load,_that.save,_that.isOnline,_that.hasPending,_that.share);case _:
  return null;

}
}

}

/// @nodoc


class _CandidateDetailState extends CandidateDetailState {
  const _CandidateDetailState({this.candidate, this.load = const RequestStatus<int>.idle(), this.save = const RequestStatus<int>.idle(), this.isOnline = true, this.hasPending = false, this.share = const RequestStatus<String>.idle()}): super._();
  

@override final  Candidate? candidate;
@override@JsonKey() final  RequestStatus<int> load;
@override@JsonKey() final  RequestStatus<int> save;
@override@JsonKey() final  bool isOnline;
@override@JsonKey() final  bool hasPending;
@override@JsonKey() final  RequestStatus<String> share;

/// Create a copy of CandidateDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidateDetailStateCopyWith<_CandidateDetailState> get copyWith => __$CandidateDetailStateCopyWithImpl<_CandidateDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidateDetailState&&(identical(other.candidate, candidate) || other.candidate == candidate)&&(identical(other.load, load) || other.load == load)&&(identical(other.save, save) || other.save == save)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.hasPending, hasPending) || other.hasPending == hasPending)&&(identical(other.share, share) || other.share == share));
}


@override
int get hashCode => Object.hash(runtimeType,candidate,load,save,isOnline,hasPending,share);

@override
String toString() {
  return 'CandidateDetailState(candidate: $candidate, load: $load, save: $save, isOnline: $isOnline, hasPending: $hasPending, share: $share)';
}


}

/// @nodoc
abstract mixin class _$CandidateDetailStateCopyWith<$Res> implements $CandidateDetailStateCopyWith<$Res> {
  factory _$CandidateDetailStateCopyWith(_CandidateDetailState value, $Res Function(_CandidateDetailState) _then) = __$CandidateDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Candidate? candidate, RequestStatus<int> load, RequestStatus<int> save, bool isOnline, bool hasPending, RequestStatus<String> share
});


@override $RequestStatusCopyWith<int, $Res> get load;@override $RequestStatusCopyWith<int, $Res> get save;@override $RequestStatusCopyWith<String, $Res> get share;

}
/// @nodoc
class __$CandidateDetailStateCopyWithImpl<$Res>
    implements _$CandidateDetailStateCopyWith<$Res> {
  __$CandidateDetailStateCopyWithImpl(this._self, this._then);

  final _CandidateDetailState _self;
  final $Res Function(_CandidateDetailState) _then;

/// Create a copy of CandidateDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? candidate = freezed,Object? load = null,Object? save = null,Object? isOnline = null,Object? hasPending = null,Object? share = null,}) {
  return _then(_CandidateDetailState(
candidate: freezed == candidate ? _self.candidate : candidate // ignore: cast_nullable_to_non_nullable
as Candidate?,load: null == load ? _self.load : load // ignore: cast_nullable_to_non_nullable
as RequestStatus<int>,save: null == save ? _self.save : save // ignore: cast_nullable_to_non_nullable
as RequestStatus<int>,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,hasPending: null == hasPending ? _self.hasPending : hasPending // ignore: cast_nullable_to_non_nullable
as bool,share: null == share ? _self.share : share // ignore: cast_nullable_to_non_nullable
as RequestStatus<String>,
  ));
}

/// Create a copy of CandidateDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<int, $Res> get load {
  
  return $RequestStatusCopyWith<int, $Res>(_self.load, (value) {
    return _then(_self.copyWith(load: value));
  });
}/// Create a copy of CandidateDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<int, $Res> get save {
  
  return $RequestStatusCopyWith<int, $Res>(_self.save, (value) {
    return _then(_self.copyWith(save: value));
  });
}/// Create a copy of CandidateDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<String, $Res> get share {
  
  return $RequestStatusCopyWith<String, $Res>(_self.share, (value) {
    return _then(_self.copyWith(share: value));
  });
}
}

// dart format on
