// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottom_bar_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BottomBarRawEvent {

 String get orderNo; String get lang;// Language List "Language ID" this event's message template lives
// under, e.g. "PB.BB.0001".
 String get languageId; String get skuNo; int get totalCups; String get menuName; String get dispenserName;
/// Create a copy of BottomBarRawEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BottomBarRawEventCopyWith<BottomBarRawEvent> get copyWith => _$BottomBarRawEventCopyWithImpl<BottomBarRawEvent>(this as BottomBarRawEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BottomBarRawEvent&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.languageId, languageId) || other.languageId == languageId)&&(identical(other.skuNo, skuNo) || other.skuNo == skuNo)&&(identical(other.totalCups, totalCups) || other.totalCups == totalCups)&&(identical(other.menuName, menuName) || other.menuName == menuName)&&(identical(other.dispenserName, dispenserName) || other.dispenserName == dispenserName));
}


@override
int get hashCode => Object.hash(runtimeType,orderNo,lang,languageId,skuNo,totalCups,menuName,dispenserName);

@override
String toString() {
  return 'BottomBarRawEvent(orderNo: $orderNo, lang: $lang, languageId: $languageId, skuNo: $skuNo, totalCups: $totalCups, menuName: $menuName, dispenserName: $dispenserName)';
}


}

/// @nodoc
abstract mixin class $BottomBarRawEventCopyWith<$Res>  {
  factory $BottomBarRawEventCopyWith(BottomBarRawEvent value, $Res Function(BottomBarRawEvent) _then) = _$BottomBarRawEventCopyWithImpl;
@useResult
$Res call({
 String orderNo, String lang, String languageId, String skuNo, int totalCups, String menuName, String dispenserName
});




}
/// @nodoc
class _$BottomBarRawEventCopyWithImpl<$Res>
    implements $BottomBarRawEventCopyWith<$Res> {
  _$BottomBarRawEventCopyWithImpl(this._self, this._then);

  final BottomBarRawEvent _self;
  final $Res Function(BottomBarRawEvent) _then;

/// Create a copy of BottomBarRawEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderNo = null,Object? lang = null,Object? languageId = null,Object? skuNo = null,Object? totalCups = null,Object? menuName = null,Object? dispenserName = null,}) {
  return _then(_self.copyWith(
orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,languageId: null == languageId ? _self.languageId : languageId // ignore: cast_nullable_to_non_nullable
as String,skuNo: null == skuNo ? _self.skuNo : skuNo // ignore: cast_nullable_to_non_nullable
as String,totalCups: null == totalCups ? _self.totalCups : totalCups // ignore: cast_nullable_to_non_nullable
as int,menuName: null == menuName ? _self.menuName : menuName // ignore: cast_nullable_to_non_nullable
as String,dispenserName: null == dispenserName ? _self.dispenserName : dispenserName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BottomBarRawEvent].
extension BottomBarRawEventPatterns on BottomBarRawEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BottomBarRawEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BottomBarRawEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BottomBarRawEvent value)  $default,){
final _that = this;
switch (_that) {
case _BottomBarRawEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BottomBarRawEvent value)?  $default,){
final _that = this;
switch (_that) {
case _BottomBarRawEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderNo,  String lang,  String languageId,  String skuNo,  int totalCups,  String menuName,  String dispenserName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BottomBarRawEvent() when $default != null:
return $default(_that.orderNo,_that.lang,_that.languageId,_that.skuNo,_that.totalCups,_that.menuName,_that.dispenserName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderNo,  String lang,  String languageId,  String skuNo,  int totalCups,  String menuName,  String dispenserName)  $default,) {final _that = this;
switch (_that) {
case _BottomBarRawEvent():
return $default(_that.orderNo,_that.lang,_that.languageId,_that.skuNo,_that.totalCups,_that.menuName,_that.dispenserName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderNo,  String lang,  String languageId,  String skuNo,  int totalCups,  String menuName,  String dispenserName)?  $default,) {final _that = this;
switch (_that) {
case _BottomBarRawEvent() when $default != null:
return $default(_that.orderNo,_that.lang,_that.languageId,_that.skuNo,_that.totalCups,_that.menuName,_that.dispenserName);case _:
  return null;

}
}

}

/// @nodoc


class _BottomBarRawEvent implements BottomBarRawEvent {
  const _BottomBarRawEvent({required this.orderNo, required this.lang, required this.languageId, this.skuNo = '', this.totalCups = 0, this.menuName = '', this.dispenserName = ''});
  

@override final  String orderNo;
@override final  String lang;
// Language List "Language ID" this event's message template lives
// under, e.g. "PB.BB.0001".
@override final  String languageId;
@override@JsonKey() final  String skuNo;
@override@JsonKey() final  int totalCups;
@override@JsonKey() final  String menuName;
@override@JsonKey() final  String dispenserName;

/// Create a copy of BottomBarRawEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BottomBarRawEventCopyWith<_BottomBarRawEvent> get copyWith => __$BottomBarRawEventCopyWithImpl<_BottomBarRawEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BottomBarRawEvent&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.languageId, languageId) || other.languageId == languageId)&&(identical(other.skuNo, skuNo) || other.skuNo == skuNo)&&(identical(other.totalCups, totalCups) || other.totalCups == totalCups)&&(identical(other.menuName, menuName) || other.menuName == menuName)&&(identical(other.dispenserName, dispenserName) || other.dispenserName == dispenserName));
}


@override
int get hashCode => Object.hash(runtimeType,orderNo,lang,languageId,skuNo,totalCups,menuName,dispenserName);

@override
String toString() {
  return 'BottomBarRawEvent(orderNo: $orderNo, lang: $lang, languageId: $languageId, skuNo: $skuNo, totalCups: $totalCups, menuName: $menuName, dispenserName: $dispenserName)';
}


}

/// @nodoc
abstract mixin class _$BottomBarRawEventCopyWith<$Res> implements $BottomBarRawEventCopyWith<$Res> {
  factory _$BottomBarRawEventCopyWith(_BottomBarRawEvent value, $Res Function(_BottomBarRawEvent) _then) = __$BottomBarRawEventCopyWithImpl;
@override @useResult
$Res call({
 String orderNo, String lang, String languageId, String skuNo, int totalCups, String menuName, String dispenserName
});




}
/// @nodoc
class __$BottomBarRawEventCopyWithImpl<$Res>
    implements _$BottomBarRawEventCopyWith<$Res> {
  __$BottomBarRawEventCopyWithImpl(this._self, this._then);

  final _BottomBarRawEvent _self;
  final $Res Function(_BottomBarRawEvent) _then;

/// Create a copy of BottomBarRawEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderNo = null,Object? lang = null,Object? languageId = null,Object? skuNo = null,Object? totalCups = null,Object? menuName = null,Object? dispenserName = null,}) {
  return _then(_BottomBarRawEvent(
orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,languageId: null == languageId ? _self.languageId : languageId // ignore: cast_nullable_to_non_nullable
as String,skuNo: null == skuNo ? _self.skuNo : skuNo // ignore: cast_nullable_to_non_nullable
as String,totalCups: null == totalCups ? _self.totalCups : totalCups // ignore: cast_nullable_to_non_nullable
as int,menuName: null == menuName ? _self.menuName : menuName // ignore: cast_nullable_to_non_nullable
as String,dispenserName: null == dispenserName ? _self.dispenserName : dispenserName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
