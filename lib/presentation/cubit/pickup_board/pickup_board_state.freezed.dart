// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PickupBoardState {

 List<OrderChip> get preparingOrders; List<OrderChip> get readyOrders; MachineStatus? get machineStatus; PickupNotice? get pickupNotice; String? get pickupNoticeMessage; String? get currentDrinkImageUrl;// Bumped by PickupBoardCubit every time a new bottom-bar message is
// shown — StatusBar keys its AnimatedSwitcher off this so it always
// triggers the slide transition, even if two consecutive messages
// happened to render identically.
 int get bottomBarEventSeq;
/// Create a copy of PickupBoardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickupBoardStateCopyWith<PickupBoardState> get copyWith => _$PickupBoardStateCopyWithImpl<PickupBoardState>(this as PickupBoardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickupBoardState&&const DeepCollectionEquality().equals(other.preparingOrders, preparingOrders)&&const DeepCollectionEquality().equals(other.readyOrders, readyOrders)&&(identical(other.machineStatus, machineStatus) || other.machineStatus == machineStatus)&&(identical(other.pickupNotice, pickupNotice) || other.pickupNotice == pickupNotice)&&(identical(other.pickupNoticeMessage, pickupNoticeMessage) || other.pickupNoticeMessage == pickupNoticeMessage)&&(identical(other.currentDrinkImageUrl, currentDrinkImageUrl) || other.currentDrinkImageUrl == currentDrinkImageUrl)&&(identical(other.bottomBarEventSeq, bottomBarEventSeq) || other.bottomBarEventSeq == bottomBarEventSeq));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(preparingOrders),const DeepCollectionEquality().hash(readyOrders),machineStatus,pickupNotice,pickupNoticeMessage,currentDrinkImageUrl,bottomBarEventSeq);

@override
String toString() {
  return 'PickupBoardState(preparingOrders: $preparingOrders, readyOrders: $readyOrders, machineStatus: $machineStatus, pickupNotice: $pickupNotice, pickupNoticeMessage: $pickupNoticeMessage, currentDrinkImageUrl: $currentDrinkImageUrl, bottomBarEventSeq: $bottomBarEventSeq)';
}


}

/// @nodoc
abstract mixin class $PickupBoardStateCopyWith<$Res>  {
  factory $PickupBoardStateCopyWith(PickupBoardState value, $Res Function(PickupBoardState) _then) = _$PickupBoardStateCopyWithImpl;
@useResult
$Res call({
 List<OrderChip> preparingOrders, List<OrderChip> readyOrders, MachineStatus? machineStatus, PickupNotice? pickupNotice, String? pickupNoticeMessage, String? currentDrinkImageUrl, int bottomBarEventSeq
});


$MachineStatusCopyWith<$Res>? get machineStatus;$PickupNoticeCopyWith<$Res>? get pickupNotice;

}
/// @nodoc
class _$PickupBoardStateCopyWithImpl<$Res>
    implements $PickupBoardStateCopyWith<$Res> {
  _$PickupBoardStateCopyWithImpl(this._self, this._then);

  final PickupBoardState _self;
  final $Res Function(PickupBoardState) _then;

/// Create a copy of PickupBoardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? preparingOrders = null,Object? readyOrders = null,Object? machineStatus = freezed,Object? pickupNotice = freezed,Object? pickupNoticeMessage = freezed,Object? currentDrinkImageUrl = freezed,Object? bottomBarEventSeq = null,}) {
  return _then(_self.copyWith(
preparingOrders: null == preparingOrders ? _self.preparingOrders : preparingOrders // ignore: cast_nullable_to_non_nullable
as List<OrderChip>,readyOrders: null == readyOrders ? _self.readyOrders : readyOrders // ignore: cast_nullable_to_non_nullable
as List<OrderChip>,machineStatus: freezed == machineStatus ? _self.machineStatus : machineStatus // ignore: cast_nullable_to_non_nullable
as MachineStatus?,pickupNotice: freezed == pickupNotice ? _self.pickupNotice : pickupNotice // ignore: cast_nullable_to_non_nullable
as PickupNotice?,pickupNoticeMessage: freezed == pickupNoticeMessage ? _self.pickupNoticeMessage : pickupNoticeMessage // ignore: cast_nullable_to_non_nullable
as String?,currentDrinkImageUrl: freezed == currentDrinkImageUrl ? _self.currentDrinkImageUrl : currentDrinkImageUrl // ignore: cast_nullable_to_non_nullable
as String?,bottomBarEventSeq: null == bottomBarEventSeq ? _self.bottomBarEventSeq : bottomBarEventSeq // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of PickupBoardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MachineStatusCopyWith<$Res>? get machineStatus {
    if (_self.machineStatus == null) {
    return null;
  }

  return $MachineStatusCopyWith<$Res>(_self.machineStatus!, (value) {
    return _then(_self.copyWith(machineStatus: value));
  });
}/// Create a copy of PickupBoardState
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


/// Adds pattern-matching-related methods to [PickupBoardState].
extension PickupBoardStatePatterns on PickupBoardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickupBoardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickupBoardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickupBoardState value)  $default,){
final _that = this;
switch (_that) {
case _PickupBoardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickupBoardState value)?  $default,){
final _that = this;
switch (_that) {
case _PickupBoardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OrderChip> preparingOrders,  List<OrderChip> readyOrders,  MachineStatus? machineStatus,  PickupNotice? pickupNotice,  String? pickupNoticeMessage,  String? currentDrinkImageUrl,  int bottomBarEventSeq)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickupBoardState() when $default != null:
return $default(_that.preparingOrders,_that.readyOrders,_that.machineStatus,_that.pickupNotice,_that.pickupNoticeMessage,_that.currentDrinkImageUrl,_that.bottomBarEventSeq);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OrderChip> preparingOrders,  List<OrderChip> readyOrders,  MachineStatus? machineStatus,  PickupNotice? pickupNotice,  String? pickupNoticeMessage,  String? currentDrinkImageUrl,  int bottomBarEventSeq)  $default,) {final _that = this;
switch (_that) {
case _PickupBoardState():
return $default(_that.preparingOrders,_that.readyOrders,_that.machineStatus,_that.pickupNotice,_that.pickupNoticeMessage,_that.currentDrinkImageUrl,_that.bottomBarEventSeq);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OrderChip> preparingOrders,  List<OrderChip> readyOrders,  MachineStatus? machineStatus,  PickupNotice? pickupNotice,  String? pickupNoticeMessage,  String? currentDrinkImageUrl,  int bottomBarEventSeq)?  $default,) {final _that = this;
switch (_that) {
case _PickupBoardState() when $default != null:
return $default(_that.preparingOrders,_that.readyOrders,_that.machineStatus,_that.pickupNotice,_that.pickupNoticeMessage,_that.currentDrinkImageUrl,_that.bottomBarEventSeq);case _:
  return null;

}
}

}

/// @nodoc


class _PickupBoardState implements PickupBoardState {
  const _PickupBoardState({final  List<OrderChip> preparingOrders = const [], final  List<OrderChip> readyOrders = const [], this.machineStatus, this.pickupNotice, this.pickupNoticeMessage, this.currentDrinkImageUrl, this.bottomBarEventSeq = 0}): _preparingOrders = preparingOrders,_readyOrders = readyOrders;
  

 final  List<OrderChip> _preparingOrders;
@override@JsonKey() List<OrderChip> get preparingOrders {
  if (_preparingOrders is EqualUnmodifiableListView) return _preparingOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preparingOrders);
}

 final  List<OrderChip> _readyOrders;
@override@JsonKey() List<OrderChip> get readyOrders {
  if (_readyOrders is EqualUnmodifiableListView) return _readyOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readyOrders);
}

@override final  MachineStatus? machineStatus;
@override final  PickupNotice? pickupNotice;
@override final  String? pickupNoticeMessage;
@override final  String? currentDrinkImageUrl;
// Bumped by PickupBoardCubit every time a new bottom-bar message is
// shown — StatusBar keys its AnimatedSwitcher off this so it always
// triggers the slide transition, even if two consecutive messages
// happened to render identically.
@override@JsonKey() final  int bottomBarEventSeq;

/// Create a copy of PickupBoardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickupBoardStateCopyWith<_PickupBoardState> get copyWith => __$PickupBoardStateCopyWithImpl<_PickupBoardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickupBoardState&&const DeepCollectionEquality().equals(other._preparingOrders, _preparingOrders)&&const DeepCollectionEquality().equals(other._readyOrders, _readyOrders)&&(identical(other.machineStatus, machineStatus) || other.machineStatus == machineStatus)&&(identical(other.pickupNotice, pickupNotice) || other.pickupNotice == pickupNotice)&&(identical(other.pickupNoticeMessage, pickupNoticeMessage) || other.pickupNoticeMessage == pickupNoticeMessage)&&(identical(other.currentDrinkImageUrl, currentDrinkImageUrl) || other.currentDrinkImageUrl == currentDrinkImageUrl)&&(identical(other.bottomBarEventSeq, bottomBarEventSeq) || other.bottomBarEventSeq == bottomBarEventSeq));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_preparingOrders),const DeepCollectionEquality().hash(_readyOrders),machineStatus,pickupNotice,pickupNoticeMessage,currentDrinkImageUrl,bottomBarEventSeq);

@override
String toString() {
  return 'PickupBoardState(preparingOrders: $preparingOrders, readyOrders: $readyOrders, machineStatus: $machineStatus, pickupNotice: $pickupNotice, pickupNoticeMessage: $pickupNoticeMessage, currentDrinkImageUrl: $currentDrinkImageUrl, bottomBarEventSeq: $bottomBarEventSeq)';
}


}

/// @nodoc
abstract mixin class _$PickupBoardStateCopyWith<$Res> implements $PickupBoardStateCopyWith<$Res> {
  factory _$PickupBoardStateCopyWith(_PickupBoardState value, $Res Function(_PickupBoardState) _then) = __$PickupBoardStateCopyWithImpl;
@override @useResult
$Res call({
 List<OrderChip> preparingOrders, List<OrderChip> readyOrders, MachineStatus? machineStatus, PickupNotice? pickupNotice, String? pickupNoticeMessage, String? currentDrinkImageUrl, int bottomBarEventSeq
});


@override $MachineStatusCopyWith<$Res>? get machineStatus;@override $PickupNoticeCopyWith<$Res>? get pickupNotice;

}
/// @nodoc
class __$PickupBoardStateCopyWithImpl<$Res>
    implements _$PickupBoardStateCopyWith<$Res> {
  __$PickupBoardStateCopyWithImpl(this._self, this._then);

  final _PickupBoardState _self;
  final $Res Function(_PickupBoardState) _then;

/// Create a copy of PickupBoardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? preparingOrders = null,Object? readyOrders = null,Object? machineStatus = freezed,Object? pickupNotice = freezed,Object? pickupNoticeMessage = freezed,Object? currentDrinkImageUrl = freezed,Object? bottomBarEventSeq = null,}) {
  return _then(_PickupBoardState(
preparingOrders: null == preparingOrders ? _self._preparingOrders : preparingOrders // ignore: cast_nullable_to_non_nullable
as List<OrderChip>,readyOrders: null == readyOrders ? _self._readyOrders : readyOrders // ignore: cast_nullable_to_non_nullable
as List<OrderChip>,machineStatus: freezed == machineStatus ? _self.machineStatus : machineStatus // ignore: cast_nullable_to_non_nullable
as MachineStatus?,pickupNotice: freezed == pickupNotice ? _self.pickupNotice : pickupNotice // ignore: cast_nullable_to_non_nullable
as PickupNotice?,pickupNoticeMessage: freezed == pickupNoticeMessage ? _self.pickupNoticeMessage : pickupNoticeMessage // ignore: cast_nullable_to_non_nullable
as String?,currentDrinkImageUrl: freezed == currentDrinkImageUrl ? _self.currentDrinkImageUrl : currentDrinkImageUrl // ignore: cast_nullable_to_non_nullable
as String?,bottomBarEventSeq: null == bottomBarEventSeq ? _self.bottomBarEventSeq : bottomBarEventSeq // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of PickupBoardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MachineStatusCopyWith<$Res>? get machineStatus {
    if (_self.machineStatus == null) {
    return null;
  }

  return $MachineStatusCopyWith<$Res>(_self.machineStatus!, (value) {
    return _then(_self.copyWith(machineStatus: value));
  });
}/// Create a copy of PickupBoardState
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
