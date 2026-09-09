// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup_notice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PickupNotice {

 String get orderNo;// Raw language code ("en"/"ja"/"ko"/"zh") FlowHub sent for this order —
// the actual localized message text is resolved separately (see
// GetTranslationUsecase / PickupBoardState.pickupNoticeMessage), not
// stored here.
 String get lang;
/// Create a copy of PickupNotice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickupNoticeCopyWith<PickupNotice> get copyWith => _$PickupNoticeCopyWithImpl<PickupNotice>(this as PickupNotice, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickupNotice&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.lang, lang) || other.lang == lang));
}


@override
int get hashCode => Object.hash(runtimeType,orderNo,lang);

@override
String toString() {
  return 'PickupNotice(orderNo: $orderNo, lang: $lang)';
}


}

/// @nodoc
abstract mixin class $PickupNoticeCopyWith<$Res>  {
  factory $PickupNoticeCopyWith(PickupNotice value, $Res Function(PickupNotice) _then) = _$PickupNoticeCopyWithImpl;
@useResult
$Res call({
 String orderNo, String lang
});




}
/// @nodoc
class _$PickupNoticeCopyWithImpl<$Res>
    implements $PickupNoticeCopyWith<$Res> {
  _$PickupNoticeCopyWithImpl(this._self, this._then);

  final PickupNotice _self;
  final $Res Function(PickupNotice) _then;

/// Create a copy of PickupNotice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderNo = null,Object? lang = null,}) {
  return _then(_self.copyWith(
orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PickupNotice].
extension PickupNoticePatterns on PickupNotice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickupNotice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickupNotice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickupNotice value)  $default,){
final _that = this;
switch (_that) {
case _PickupNotice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickupNotice value)?  $default,){
final _that = this;
switch (_that) {
case _PickupNotice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderNo,  String lang)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickupNotice() when $default != null:
return $default(_that.orderNo,_that.lang);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderNo,  String lang)  $default,) {final _that = this;
switch (_that) {
case _PickupNotice():
return $default(_that.orderNo,_that.lang);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderNo,  String lang)?  $default,) {final _that = this;
switch (_that) {
case _PickupNotice() when $default != null:
return $default(_that.orderNo,_that.lang);case _:
  return null;

}
}

}

/// @nodoc


class _PickupNotice implements PickupNotice {
  const _PickupNotice({required this.orderNo, this.lang = ''});
  

@override final  String orderNo;
// Raw language code ("en"/"ja"/"ko"/"zh") FlowHub sent for this order —
// the actual localized message text is resolved separately (see
// GetTranslationUsecase / PickupBoardState.pickupNoticeMessage), not
// stored here.
@override@JsonKey() final  String lang;

/// Create a copy of PickupNotice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickupNoticeCopyWith<_PickupNotice> get copyWith => __$PickupNoticeCopyWithImpl<_PickupNotice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickupNotice&&(identical(other.orderNo, orderNo) || other.orderNo == orderNo)&&(identical(other.lang, lang) || other.lang == lang));
}


@override
int get hashCode => Object.hash(runtimeType,orderNo,lang);

@override
String toString() {
  return 'PickupNotice(orderNo: $orderNo, lang: $lang)';
}


}

/// @nodoc
abstract mixin class _$PickupNoticeCopyWith<$Res> implements $PickupNoticeCopyWith<$Res> {
  factory _$PickupNoticeCopyWith(_PickupNotice value, $Res Function(_PickupNotice) _then) = __$PickupNoticeCopyWithImpl;
@override @useResult
$Res call({
 String orderNo, String lang
});




}
/// @nodoc
class __$PickupNoticeCopyWithImpl<$Res>
    implements _$PickupNoticeCopyWith<$Res> {
  __$PickupNoticeCopyWithImpl(this._self, this._then);

  final _PickupNotice _self;
  final $Res Function(_PickupNotice) _then;

/// Create a copy of PickupNotice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderNo = null,Object? lang = null,}) {
  return _then(_PickupNotice(
orderNo: null == orderNo ? _self.orderNo : orderNo // ignore: cast_nullable_to_non_nullable
as String,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
