// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidates_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CandidatesListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidatesListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CandidatesListEvent()';
}


}

/// @nodoc
class $CandidatesListEventCopyWith<$Res>  {
$CandidatesListEventCopyWith(CandidatesListEvent _, $Res Function(CandidatesListEvent) __);
}


/// Adds pattern-matching-related methods to [CandidatesListEvent].
extension CandidatesListEventPatterns on CandidatesListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( _NextPageRequested value)?  nextPageRequested,TResult Function( _Refreshed value)?  refreshed,TResult Function( _VerdictChanged value)?  verdictChanged,TResult Function( _QueryChanged value)?  queryChanged,TResult Function( _SortChanged value)?  sortChanged,TResult Function( _CandidatesUpdated value)?  candidatesUpdated,TResult Function( _OnlineChanged value)?  onlineChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _VerdictChanged() when verdictChanged != null:
return verdictChanged(_that);case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _SortChanged() when sortChanged != null:
return sortChanged(_that);case _CandidatesUpdated() when candidatesUpdated != null:
return candidatesUpdated(_that);case _OnlineChanged() when onlineChanged != null:
return onlineChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( _NextPageRequested value)  nextPageRequested,required TResult Function( _Refreshed value)  refreshed,required TResult Function( _VerdictChanged value)  verdictChanged,required TResult Function( _QueryChanged value)  queryChanged,required TResult Function( _SortChanged value)  sortChanged,required TResult Function( _CandidatesUpdated value)  candidatesUpdated,required TResult Function( _OnlineChanged value)  onlineChanged,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case _NextPageRequested():
return nextPageRequested(_that);case _Refreshed():
return refreshed(_that);case _VerdictChanged():
return verdictChanged(_that);case _QueryChanged():
return queryChanged(_that);case _SortChanged():
return sortChanged(_that);case _CandidatesUpdated():
return candidatesUpdated(_that);case _OnlineChanged():
return onlineChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( _NextPageRequested value)?  nextPageRequested,TResult? Function( _Refreshed value)?  refreshed,TResult? Function( _VerdictChanged value)?  verdictChanged,TResult? Function( _QueryChanged value)?  queryChanged,TResult? Function( _SortChanged value)?  sortChanged,TResult? Function( _CandidatesUpdated value)?  candidatesUpdated,TResult? Function( _OnlineChanged value)?  onlineChanged,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case _NextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case _Refreshed() when refreshed != null:
return refreshed(_that);case _VerdictChanged() when verdictChanged != null:
return verdictChanged(_that);case _QueryChanged() when queryChanged != null:
return queryChanged(_that);case _SortChanged() when sortChanged != null:
return sortChanged(_that);case _CandidatesUpdated() when candidatesUpdated != null:
return candidatesUpdated(_that);case _OnlineChanged() when onlineChanged != null:
return onlineChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  nextPageRequested,TResult Function()?  refreshed,TResult Function( CandidateVerdict? verdict)?  verdictChanged,TResult Function( String query)?  queryChanged,TResult Function( SortField sort)?  sortChanged,TResult Function( List<CandidateLight> items)?  candidatesUpdated,TResult Function( bool isOnline)?  onlineChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _NextPageRequested() when nextPageRequested != null:
return nextPageRequested();case _Refreshed() when refreshed != null:
return refreshed();case _VerdictChanged() when verdictChanged != null:
return verdictChanged(_that.verdict);case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _SortChanged() when sortChanged != null:
return sortChanged(_that.sort);case _CandidatesUpdated() when candidatesUpdated != null:
return candidatesUpdated(_that.items);case _OnlineChanged() when onlineChanged != null:
return onlineChanged(_that.isOnline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  nextPageRequested,required TResult Function()  refreshed,required TResult Function( CandidateVerdict? verdict)  verdictChanged,required TResult Function( String query)  queryChanged,required TResult Function( SortField sort)  sortChanged,required TResult Function( List<CandidateLight> items)  candidatesUpdated,required TResult Function( bool isOnline)  onlineChanged,}) {final _that = this;
switch (_that) {
case _Started():
return started();case _NextPageRequested():
return nextPageRequested();case _Refreshed():
return refreshed();case _VerdictChanged():
return verdictChanged(_that.verdict);case _QueryChanged():
return queryChanged(_that.query);case _SortChanged():
return sortChanged(_that.sort);case _CandidatesUpdated():
return candidatesUpdated(_that.items);case _OnlineChanged():
return onlineChanged(_that.isOnline);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  nextPageRequested,TResult? Function()?  refreshed,TResult? Function( CandidateVerdict? verdict)?  verdictChanged,TResult? Function( String query)?  queryChanged,TResult? Function( SortField sort)?  sortChanged,TResult? Function( List<CandidateLight> items)?  candidatesUpdated,TResult? Function( bool isOnline)?  onlineChanged,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case _NextPageRequested() when nextPageRequested != null:
return nextPageRequested();case _Refreshed() when refreshed != null:
return refreshed();case _VerdictChanged() when verdictChanged != null:
return verdictChanged(_that.verdict);case _QueryChanged() when queryChanged != null:
return queryChanged(_that.query);case _SortChanged() when sortChanged != null:
return sortChanged(_that.sort);case _CandidatesUpdated() when candidatesUpdated != null:
return candidatesUpdated(_that.items);case _OnlineChanged() when onlineChanged != null:
return onlineChanged(_that.isOnline);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements CandidatesListEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CandidatesListEvent.started()';
}


}




/// @nodoc


class _NextPageRequested implements CandidatesListEvent {
  const _NextPageRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CandidatesListEvent.nextPageRequested()';
}


}




/// @nodoc


class _Refreshed implements CandidatesListEvent {
  const _Refreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Refreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CandidatesListEvent.refreshed()';
}


}




/// @nodoc


class _VerdictChanged implements CandidatesListEvent {
  const _VerdictChanged(this.verdict);
  

 final  CandidateVerdict? verdict;

/// Create a copy of CandidatesListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerdictChangedCopyWith<_VerdictChanged> get copyWith => __$VerdictChangedCopyWithImpl<_VerdictChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerdictChanged&&(identical(other.verdict, verdict) || other.verdict == verdict));
}


@override
int get hashCode => Object.hash(runtimeType,verdict);

@override
String toString() {
  return 'CandidatesListEvent.verdictChanged(verdict: $verdict)';
}


}

/// @nodoc
abstract mixin class _$VerdictChangedCopyWith<$Res> implements $CandidatesListEventCopyWith<$Res> {
  factory _$VerdictChangedCopyWith(_VerdictChanged value, $Res Function(_VerdictChanged) _then) = __$VerdictChangedCopyWithImpl;
@useResult
$Res call({
 CandidateVerdict? verdict
});




}
/// @nodoc
class __$VerdictChangedCopyWithImpl<$Res>
    implements _$VerdictChangedCopyWith<$Res> {
  __$VerdictChangedCopyWithImpl(this._self, this._then);

  final _VerdictChanged _self;
  final $Res Function(_VerdictChanged) _then;

/// Create a copy of CandidatesListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verdict = freezed,}) {
  return _then(_VerdictChanged(
freezed == verdict ? _self.verdict : verdict // ignore: cast_nullable_to_non_nullable
as CandidateVerdict?,
  ));
}


}

/// @nodoc


class _QueryChanged implements CandidatesListEvent {
  const _QueryChanged(this.query);
  

 final  String query;

/// Create a copy of CandidatesListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueryChangedCopyWith<_QueryChanged> get copyWith => __$QueryChangedCopyWithImpl<_QueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'CandidatesListEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class _$QueryChangedCopyWith<$Res> implements $CandidatesListEventCopyWith<$Res> {
  factory _$QueryChangedCopyWith(_QueryChanged value, $Res Function(_QueryChanged) _then) = __$QueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$QueryChangedCopyWithImpl<$Res>
    implements _$QueryChangedCopyWith<$Res> {
  __$QueryChangedCopyWithImpl(this._self, this._then);

  final _QueryChanged _self;
  final $Res Function(_QueryChanged) _then;

/// Create a copy of CandidatesListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_QueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SortChanged implements CandidatesListEvent {
  const _SortChanged(this.sort);
  

 final  SortField sort;

/// Create a copy of CandidatesListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SortChangedCopyWith<_SortChanged> get copyWith => __$SortChangedCopyWithImpl<_SortChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SortChanged&&(identical(other.sort, sort) || other.sort == sort));
}


@override
int get hashCode => Object.hash(runtimeType,sort);

@override
String toString() {
  return 'CandidatesListEvent.sortChanged(sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$SortChangedCopyWith<$Res> implements $CandidatesListEventCopyWith<$Res> {
  factory _$SortChangedCopyWith(_SortChanged value, $Res Function(_SortChanged) _then) = __$SortChangedCopyWithImpl;
@useResult
$Res call({
 SortField sort
});




}
/// @nodoc
class __$SortChangedCopyWithImpl<$Res>
    implements _$SortChangedCopyWith<$Res> {
  __$SortChangedCopyWithImpl(this._self, this._then);

  final _SortChanged _self;
  final $Res Function(_SortChanged) _then;

/// Create a copy of CandidatesListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sort = null,}) {
  return _then(_SortChanged(
null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as SortField,
  ));
}


}

/// @nodoc


class _CandidatesUpdated implements CandidatesListEvent {
  const _CandidatesUpdated(final  List<CandidateLight> items): _items = items;
  

 final  List<CandidateLight> _items;
 List<CandidateLight> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CandidatesListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidatesUpdatedCopyWith<_CandidatesUpdated> get copyWith => __$CandidatesUpdatedCopyWithImpl<_CandidatesUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidatesUpdated&&const DeepCollectionEquality().equals(other._items, _items));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CandidatesListEvent.candidatesUpdated(items: $items)';
}


}

/// @nodoc
abstract mixin class _$CandidatesUpdatedCopyWith<$Res> implements $CandidatesListEventCopyWith<$Res> {
  factory _$CandidatesUpdatedCopyWith(_CandidatesUpdated value, $Res Function(_CandidatesUpdated) _then) = __$CandidatesUpdatedCopyWithImpl;
@useResult
$Res call({
 List<CandidateLight> items
});




}
/// @nodoc
class __$CandidatesUpdatedCopyWithImpl<$Res>
    implements _$CandidatesUpdatedCopyWith<$Res> {
  __$CandidatesUpdatedCopyWithImpl(this._self, this._then);

  final _CandidatesUpdated _self;
  final $Res Function(_CandidatesUpdated) _then;

/// Create a copy of CandidatesListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_CandidatesUpdated(
null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CandidateLight>,
  ));
}


}

/// @nodoc


class _OnlineChanged implements CandidatesListEvent {
  const _OnlineChanged({required this.isOnline});
  

 final  bool isOnline;

/// Create a copy of CandidatesListEvent
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
  return 'CandidatesListEvent.onlineChanged(isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class _$OnlineChangedCopyWith<$Res> implements $CandidatesListEventCopyWith<$Res> {
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

/// Create a copy of CandidatesListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isOnline = null,}) {
  return _then(_OnlineChanged(
isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$CandidatesListState {

 List<CandidateLight> get items; CandidatesFilter get filter; bool get hasMore; bool get isOnline; RequestStatus<int> get loadMore; RequestStatus<int> get refresh;
/// Create a copy of CandidatesListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidatesListStateCopyWith<CandidatesListState> get copyWith => _$CandidatesListStateCopyWithImpl<CandidatesListState>(this as CandidatesListState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidatesListState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.loadMore, loadMore) || other.loadMore == loadMore)&&(identical(other.refresh, refresh) || other.refresh == refresh));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),filter,hasMore,isOnline,loadMore,refresh);

@override
String toString() {
  return 'CandidatesListState(items: $items, filter: $filter, hasMore: $hasMore, isOnline: $isOnline, loadMore: $loadMore, refresh: $refresh)';
}


}

/// @nodoc
abstract mixin class $CandidatesListStateCopyWith<$Res>  {
  factory $CandidatesListStateCopyWith(CandidatesListState value, $Res Function(CandidatesListState) _then) = _$CandidatesListStateCopyWithImpl;
@useResult
$Res call({
 List<CandidateLight> items, CandidatesFilter filter, bool hasMore, bool isOnline, RequestStatus<int> loadMore, RequestStatus<int> refresh
});


$RequestStatusCopyWith<int, $Res> get loadMore;$RequestStatusCopyWith<int, $Res> get refresh;

}
/// @nodoc
class _$CandidatesListStateCopyWithImpl<$Res>
    implements $CandidatesListStateCopyWith<$Res> {
  _$CandidatesListStateCopyWithImpl(this._self, this._then);

  final CandidatesListState _self;
  final $Res Function(CandidatesListState) _then;

/// Create a copy of CandidatesListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? filter = null,Object? hasMore = null,Object? isOnline = null,Object? loadMore = null,Object? refresh = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CandidateLight>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as CandidatesFilter,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,loadMore: null == loadMore ? _self.loadMore : loadMore // ignore: cast_nullable_to_non_nullable
as RequestStatus<int>,refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as RequestStatus<int>,
  ));
}
/// Create a copy of CandidatesListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<int, $Res> get loadMore {
  
  return $RequestStatusCopyWith<int, $Res>(_self.loadMore, (value) {
    return _then(_self.copyWith(loadMore: value));
  });
}/// Create a copy of CandidatesListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<int, $Res> get refresh {
  
  return $RequestStatusCopyWith<int, $Res>(_self.refresh, (value) {
    return _then(_self.copyWith(refresh: value));
  });
}
}


/// Adds pattern-matching-related methods to [CandidatesListState].
extension CandidatesListStatePatterns on CandidatesListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CandidatesListState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CandidatesListState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CandidatesListState value)  $default,){
final _that = this;
switch (_that) {
case _CandidatesListState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CandidatesListState value)?  $default,){
final _that = this;
switch (_that) {
case _CandidatesListState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CandidateLight> items,  CandidatesFilter filter,  bool hasMore,  bool isOnline,  RequestStatus<int> loadMore,  RequestStatus<int> refresh)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandidatesListState() when $default != null:
return $default(_that.items,_that.filter,_that.hasMore,_that.isOnline,_that.loadMore,_that.refresh);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CandidateLight> items,  CandidatesFilter filter,  bool hasMore,  bool isOnline,  RequestStatus<int> loadMore,  RequestStatus<int> refresh)  $default,) {final _that = this;
switch (_that) {
case _CandidatesListState():
return $default(_that.items,_that.filter,_that.hasMore,_that.isOnline,_that.loadMore,_that.refresh);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CandidateLight> items,  CandidatesFilter filter,  bool hasMore,  bool isOnline,  RequestStatus<int> loadMore,  RequestStatus<int> refresh)?  $default,) {final _that = this;
switch (_that) {
case _CandidatesListState() when $default != null:
return $default(_that.items,_that.filter,_that.hasMore,_that.isOnline,_that.loadMore,_that.refresh);case _:
  return null;

}
}

}

/// @nodoc


class _CandidatesListState implements CandidatesListState {
  const _CandidatesListState({final  List<CandidateLight> items = const <CandidateLight>[], this.filter = const CandidatesFilter(), this.hasMore = true, this.isOnline = true, this.loadMore = const RequestStatus<int>.idle(), this.refresh = const RequestStatus<int>.idle()}): _items = items;
  

 final  List<CandidateLight> _items;
@override@JsonKey() List<CandidateLight> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  CandidatesFilter filter;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isOnline;
@override@JsonKey() final  RequestStatus<int> loadMore;
@override@JsonKey() final  RequestStatus<int> refresh;

/// Create a copy of CandidatesListState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidatesListStateCopyWith<_CandidatesListState> get copyWith => __$CandidatesListStateCopyWithImpl<_CandidatesListState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidatesListState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline)&&(identical(other.loadMore, loadMore) || other.loadMore == loadMore)&&(identical(other.refresh, refresh) || other.refresh == refresh));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),filter,hasMore,isOnline,loadMore,refresh);

@override
String toString() {
  return 'CandidatesListState(items: $items, filter: $filter, hasMore: $hasMore, isOnline: $isOnline, loadMore: $loadMore, refresh: $refresh)';
}


}

/// @nodoc
abstract mixin class _$CandidatesListStateCopyWith<$Res> implements $CandidatesListStateCopyWith<$Res> {
  factory _$CandidatesListStateCopyWith(_CandidatesListState value, $Res Function(_CandidatesListState) _then) = __$CandidatesListStateCopyWithImpl;
@override @useResult
$Res call({
 List<CandidateLight> items, CandidatesFilter filter, bool hasMore, bool isOnline, RequestStatus<int> loadMore, RequestStatus<int> refresh
});


@override $RequestStatusCopyWith<int, $Res> get loadMore;@override $RequestStatusCopyWith<int, $Res> get refresh;

}
/// @nodoc
class __$CandidatesListStateCopyWithImpl<$Res>
    implements _$CandidatesListStateCopyWith<$Res> {
  __$CandidatesListStateCopyWithImpl(this._self, this._then);

  final _CandidatesListState _self;
  final $Res Function(_CandidatesListState) _then;

/// Create a copy of CandidatesListState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? filter = null,Object? hasMore = null,Object? isOnline = null,Object? loadMore = null,Object? refresh = null,}) {
  return _then(_CandidatesListState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CandidateLight>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as CandidatesFilter,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,loadMore: null == loadMore ? _self.loadMore : loadMore // ignore: cast_nullable_to_non_nullable
as RequestStatus<int>,refresh: null == refresh ? _self.refresh : refresh // ignore: cast_nullable_to_non_nullable
as RequestStatus<int>,
  ));
}

/// Create a copy of CandidatesListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<int, $Res> get loadMore {
  
  return $RequestStatusCopyWith<int, $Res>(_self.loadMore, (value) {
    return _then(_self.copyWith(loadMore: value));
  });
}/// Create a copy of CandidatesListState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStatusCopyWith<int, $Res> get refresh {
  
  return $RequestStatusCopyWith<int, $Res>(_self.refresh, (value) {
    return _then(_self.copyWith(refresh: value));
  });
}
}

// dart format on
