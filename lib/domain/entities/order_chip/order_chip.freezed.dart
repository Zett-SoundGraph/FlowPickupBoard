// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_chip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderChip {

 String get orderNo; int get cupCount;/// 0.0–1.0 brew progress shown in the Preparing gauge footer.
 double get progress;/// Ready-section only: true once an order has sat past FlowHub's
/// elapsed-time threshold, rendered in the red "overdue" fill instead of
/// the default translucent one.
 bool get isOverdue;
/// Create a copy of OrderChip
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderChipCopyWith<OrderChip> get copyWith => _$OrderChipCopyWithImpl<OrderChip>(this as OrderChip, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderChip&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.cupCount, cupCount) || other.cupCount == cupCount)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue));
}


@override
int get hashCode => Object.hash(runtimeType,orderNo,cupCount,progress,isOverdue);

@override
String toString() {
  return 'OrderChip(orderNo: $orderNo, cupCount: $cupCount, progress: $progress, isOverdue: $isOverdue)';
}


}

/// @nodoc
abstract mixin class $OrderChipCopyWith<$Res>  {
  factory $OrderChipCopyWith(OrderChip value, $Res Function(OrderChip) _then) = _$OrderChipCopyWithImpl;
@useResult
$Res call({
 String orderNo, int cupCount, double progress, bool isOverdue
});




}
/// @nodoc
class _$OrderChipCopyWithImpl<$Res>
    implements $OrderChipCopyWith<$Res> {
  _$OrderChipCopyWithImpl(this._self, this._then);

  final OrderChip _self;
  final $Res Function(OrderChip) _then;

/// Create a copy of OrderChip
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderNo = null,Object? cupCount = null,Object? progress = null,Object? isOverdue = null,}) {
  return _then(_self.copyWith(
orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,cupCount: null == cupCount ? _self.cupCount : cupCount // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderChip].
extension OrderChipPatterns on OrderChip {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderChip value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderChip() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderChip value)  $default,){
final _that = this;
switch (_that) {
case _OrderChip():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderChip value)?  $default,){
final _that = this;
switch (_that) {
case _OrderChip() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderNo,  int cupCount,  double progress,  bool isOverdue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderChip() when $default != null:
return $default(_that.orderNo,_that.cupCount,_that.progress,_that.isOverdue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderNo,  int cupCount,  double progress,  bool isOverdue)  $default,) {final _that = this;
switch (_that) {
case _OrderChip():
return $default(_that.orderNo,_that.cupCount,_that.progress,_that.isOverdue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderNo,  int cupCount,  double progress,  bool isOverdue)?  $default,) {final _that = this;
switch (_that) {
case _OrderChip() when $default != null:
return $default(_that.orderNo,_that.cupCount,_that.progress,_that.isOverdue);case _:
  return null;

}
}

}

/// @nodoc


class _OrderChip implements OrderChip {
  const _OrderChip({required this.orderNo, required this.cupCount, required this.progress, this.isOverdue = false});
  

@override final  String orderNo;
@override final  int cupCount;
/// 0.0–1.0 brew progress shown in the Preparing gauge footer.
@override final  double progress;
/// Ready-section only: true once an order has sat past FlowHub's
/// elapsed-time threshold, rendered in the red "overdue" fill instead of
/// the default translucent one.
@override@JsonKey() final  bool isOverdue;

/// Create a copy of OrderChip
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderChipCopyWith<_OrderChip> get copyWith => __$OrderChipCopyWithImpl<_OrderChip>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderChip&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.cupCount, cupCount) || other.cupCount == cupCount)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.isOverdue, isOverdue) || other.isOverdue == isOverdue));
}


@override
int get hashCode => Object.hash(runtimeType,orderNo,cupCount,progress,isOverdue);

@override
String toString() {
  return 'OrderChip(orderNo: $orderNo, cupCount: $cupCount, progress: $progress, isOverdue: $isOverdue)';
}


}

/// @nodoc
abstract mixin class _$OrderChipCopyWith<$Res> implements $OrderChipCopyWith<$Res> {
  factory _$OrderChipCopyWith(_OrderChip value, $Res Function(_OrderChip) _then) = __$OrderChipCopyWithImpl;
@override @useResult
$Res call({
 String orderNo, int cupCount, double progress, bool isOverdue
});




}
/// @nodoc
class __$OrderChipCopyWithImpl<$Res>
    implements _$OrderChipCopyWith<$Res> {
  __$OrderChipCopyWithImpl(this._self, this._then);

  final _OrderChip _self;
  final $Res Function(_OrderChip) _then;

/// Create a copy of OrderChip
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderNo = null,Object? cupCount = null,Object? progress = null,Object? isOverdue = null,}) {
  return _then(_OrderChip(
orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,cupCount: null == cupCount ? _self.cupCount : cupCount // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,isOverdue: null == isOverdue ? _self.isOverdue : isOverdue // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
