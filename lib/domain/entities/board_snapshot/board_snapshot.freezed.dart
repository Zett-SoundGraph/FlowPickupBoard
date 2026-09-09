// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BoardSnapshot {

 List<OrderChip> get preparingOrders; List<OrderChip> get readyOrders; PickupNotice? get pickupNotice;// Bottom-bar-worthy events detected THIS broadcast (edge-detected
// against the data source's own running state) — usually empty; the
// cubit queues these up and displays them one at a time (see
// PickupBoardCubit's message queue). Not a replacement for
// MachineStatus — that's now entirely cubit-derived from this queue,
// not sourced from the snapshot at all.
 List<BottomBarRawEvent> get newBottomBarEvents;
/// Create a copy of BoardSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardSnapshotCopyWith<BoardSnapshot> get copyWith => _$BoardSnapshotCopyWithImpl<BoardSnapshot>(this as BoardSnapshot, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardSnapshot&&const DeepCollectionEquality().equals(other.preparingOrders, preparingOrders)&&const DeepCollectionEquality().equals(other.readyOrders, readyOrders)&&(identical(other.pickupNotice, pickupNotice) || other.pickupNotice == pickupNotice)&&const DeepCollectionEquality().equals(other.newBottomBarEvents, newBottomBarEvents));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(preparingOrders),const DeepCollectionEquality().hash(readyOrders),pickupNotice,const DeepCollectionEquality().hash(newBottomBarEvents));

@override
String toString() {
  return 'BoardSnapshot(preparingOrders: $preparingOrders, readyOrders: $readyOrders, pickupNotice: $pickupNotice, newBottomBarEvents: $newBottomBarEvents)';
}


}

/// @nodoc
abstract mixin class $BoardSnapshotCopyWith<$Res>  {
  factory $BoardSnapshotCopyWith(BoardSnapshot value, $Res Function(BoardSnapshot) _then) = _$BoardSnapshotCopyWithImpl;
@useResult
$Res call({
 List<OrderChip> preparingOrders, List<OrderChip> readyOrders, PickupNotice? pickupNotice, List<BottomBarRawEvent> newBottomBarEvents
});


$PickupNoticeCopyWith<$Res>? get pickupNotice;

}
/// @nodoc
class _$BoardSnapshotCopyWithImpl<$Res>
    implements $BoardSnapshotCopyWith<$Res> {
  _$BoardSnapshotCopyWithImpl(this._self, this._then);

  final BoardSnapshot _self;
  final $Res Function(BoardSnapshot) _then;

/// Create a copy of BoardSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? preparingOrders = null,Object? readyOrders = null,Object? pickupNotice = freezed,Object? newBottomBarEvents = null,}) {
  return _then(_self.copyWith(
preparingOrders: null == preparingOrders ? _self.preparingOrders : preparingOrders // ignore: cast_nullable_to_non_nullable
as List<OrderChip>,readyOrders: null == readyOrders ? _self.readyOrders : readyOrders // ignore: cast_nullable_to_non_nullable
as List<OrderChip>,pickupNotice: freezed == pickupNotice ? _self.pickupNotice : pickupNotice // ignore: cast_nullable_to_non_nullable
as PickupNotice?,newBottomBarEvents: null == newBottomBarEvents ? _self.newBottomBarEvents : newBottomBarEvents // ignore: cast_nullable_to_non_nullable
as List<BottomBarRawEvent>,
  ));
}
/// Create a copy of BoardSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PickupNoticeCopyWith<$Res>? get pickupNotice {
    if (_self.pickupNotice == null) {
    return null;
  }

  return $PickupNoticeCopyWith<$Res>(_self.pickupNotice!, (value) {
    return _then(_self.copyWith(pickupNotice: value));
  });
}
}


/// Adds pattern-matching-related methods to [BoardSnapshot].
extension BoardSnapshotPatterns on BoardSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _BoardSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _BoardSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OrderChip> preparingOrders,  List<OrderChip> readyOrders,  PickupNotice? pickupNotice,  List<BottomBarRawEvent> newBottomBarEvents)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardSnapshot() when $default != null:
return $default(_that.preparingOrders,_that.readyOrders,_that.pickupNotice,_that.newBottomBarEvents);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OrderChip> preparingOrders,  List<OrderChip> readyOrders,  PickupNotice? pickupNotice,  List<BottomBarRawEvent> newBottomBarEvents)  $default,) {final _that = this;
switch (_that) {
case _BoardSnapshot():
return $default(_that.preparingOrders,_that.readyOrders,_that.pickupNotice,_that.newBottomBarEvents);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OrderChip> preparingOrders,  List<OrderChip> readyOrders,  PickupNotice? pickupNotice,  List<BottomBarRawEvent> newBottomBarEvents)?  $default,) {final _that = this;
switch (_that) {
case _BoardSnapshot() when $default != null:
return $default(_that.preparingOrders,_that.readyOrders,_that.pickupNotice,_that.newBottomBarEvents);case _:
  return null;

}
}

}

/// @nodoc


class _BoardSnapshot implements BoardSnapshot {
  const _BoardSnapshot({required final  List<OrderChip> preparingOrders, required final  List<OrderChip> readyOrders, this.pickupNotice, final  List<BottomBarRawEvent> newBottomBarEvents = const []}): _preparingOrders = preparingOrders,_readyOrders = readyOrders,_newBottomBarEvents = newBottomBarEvents;
  

 final  List<OrderChip> _preparingOrders;
@override List<OrderChip> get preparingOrders {
  if (_preparingOrders is EqualUnmodifiableListView) return _preparingOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preparingOrders);
}

 final  List<OrderChip> _readyOrders;
@override List<OrderChip> get readyOrders {
  if (_readyOrders is EqualUnmodifiableListView) return _readyOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readyOrders);
}

@override final  PickupNotice? pickupNotice;
// Bottom-bar-worthy events detected THIS broadcast (edge-detected
// against the data source's own running state) — usually empty; the
// cubit queues these up and displays them one at a time (see
// PickupBoardCubit's message queue). Not a replacement for
// MachineStatus — that's now entirely cubit-derived from this queue,
// not sourced from the snapshot at all.
 final  List<BottomBarRawEvent> _newBottomBarEvents;
// Bottom-bar-worthy events detected THIS broadcast (edge-detected
// against the data source's own running state) — usually empty; the
// cubit queues these up and displays them one at a time (see
// PickupBoardCubit's message queue). Not a replacement for
// MachineStatus — that's now entirely cubit-derived from this queue,
// not sourced from the snapshot at all.
@override@JsonKey() List<BottomBarRawEvent> get newBottomBarEvents {
  if (_newBottomBarEvents is EqualUnmodifiableListView) return _newBottomBarEvents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newBottomBarEvents);
}


/// Create a copy of BoardSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardSnapshotCopyWith<_BoardSnapshot> get copyWith => __$BoardSnapshotCopyWithImpl<_BoardSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardSnapshot&&const DeepCollectionEquality().equals(other._preparingOrders, _preparingOrders)&&const DeepCollectionEquality().equals(other._readyOrders, _readyOrders)&&(identical(other.pickupNotice, pickupNotice) || other.pickupNotice == pickupNotice)&&const DeepCollectionEquality().equals(other._newBottomBarEvents, _newBottomBarEvents));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_preparingOrders),const DeepCollectionEquality().hash(_readyOrders),pickupNotice,const DeepCollectionEquality().hash(_newBottomBarEvents));

@override
String toString() {
  return 'BoardSnapshot(preparingOrders: $preparingOrders, readyOrders: $readyOrders, pickupNotice: $pickupNotice, newBottomBarEvents: $newBottomBarEvents)';
}


}

/// @nodoc
abstract mixin class _$BoardSnapshotCopyWith<$Res> implements $BoardSnapshotCopyWith<$Res> {
  factory _$BoardSnapshotCopyWith(_BoardSnapshot value, $Res Function(_BoardSnapshot) _then) = __$BoardSnapshotCopyWithImpl;
@override @useResult
$Res call({
 List<OrderChip> preparingOrders, List<OrderChip> readyOrders, PickupNotice? pickupNotice, List<BottomBarRawEvent> newBottomBarEvents
});


@override $PickupNoticeCopyWith<$Res>? get pickupNotice;

}
/// @nodoc
class __$BoardSnapshotCopyWithImpl<$Res>
    implements _$BoardSnapshotCopyWith<$Res> {
  __$BoardSnapshotCopyWithImpl(this._self, this._then);

  final _BoardSnapshot _self;
  final $Res Function(_BoardSnapshot) _then;

/// Create a copy of BoardSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? preparingOrders = null,Object? readyOrders = null,Object? pickupNotice = freezed,Object? newBottomBarEvents = null,}) {
  return _then(_BoardSnapshot(
preparingOrders: null == preparingOrders ? _self._preparingOrders : preparingOrders // ignore: cast_nullable_to_non_nullable
as List<OrderChip>,readyOrders: null == readyOrders ? _self._readyOrders : readyOrders // ignore: cast_nullable_to_non_nullable
as List<OrderChip>,pickupNotice: freezed == pickupNotice ? _self.pickupNotice : pickupNotice // ignore: cast_nullable_to_non_nullable
as PickupNotice?,newBottomBarEvents: null == newBottomBarEvents ? _self._newBottomBarEvents : newBottomBarEvents // ignore: cast_nullable_to_non_nullable
as List<BottomBarRawEvent>,
  ));
}

/// Create a copy of BoardSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PickupNoticeCopyWith<$Res>? get pickupNotice {
    if (_self.pickupNotice == null) {
    return null;
  }

  return $PickupNoticeCopyWith<$Res>(_self.pickupNotice!, (value) {
    return _then(_self.copyWith(pickupNotice: value));
  });
}
}

// dart format on
