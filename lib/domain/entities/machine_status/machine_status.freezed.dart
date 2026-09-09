// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'machine_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MachineStatus {

 String get machineOrderNo; String get message; String? get skuNo; String? get temp; int? get totalCups; int? get seq;// Raw language code ("en"/"ja"/"ko"/"zh") this message was resolved in —
// see AppFonts.fontFamilyForLanguage, used by StatusBar to pick the
// right font for [message].
 String get lang;
/// Create a copy of MachineStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MachineStatusCopyWith<MachineStatus> get copyWith => _$MachineStatusCopyWithImpl<MachineStatus>(this as MachineStatus, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MachineStatus&&(identical(other.machineOrderNo, machineOrderNo) || other.machineOrderNo == machineOrderNo)&&(identical(other.message, message) || other.message == message)&&(identical(other.skuNo, skuNo) || other.skuNo == skuNo)&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.totalCups, totalCups) || other.totalCups == totalCups)&&(identical(other.seq, seq) || other.seq == seq)&&(identical(other.lang, lang) || other.lang == lang));
}


@override
int get hashCode => Object.hash(runtimeType,machineOrderNo,message,skuNo,temp,totalCups,seq,lang);

@override
String toString() {
  return 'MachineStatus(machineOrderNo: $machineOrderNo, message: $message, skuNo: $skuNo, temp: $temp, totalCups: $totalCups, seq: $seq, lang: $lang)';
}


}

/// @nodoc
abstract mixin class $MachineStatusCopyWith<$Res>  {
  factory $MachineStatusCopyWith(MachineStatus value, $Res Function(MachineStatus) _then) = _$MachineStatusCopyWithImpl;
@useResult
$Res call({
 String machineOrderNo, String message, String? skuNo, String? temp, int? totalCups, int? seq, String lang
});




}
/// @nodoc
class _$MachineStatusCopyWithImpl<$Res>
    implements $MachineStatusCopyWith<$Res> {
  _$MachineStatusCopyWithImpl(this._self, this._then);

  final MachineStatus _self;
  final $Res Function(MachineStatus) _then;

/// Create a copy of MachineStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? machineOrderNo = null,Object? message = null,Object? skuNo = freezed,Object? temp = freezed,Object? totalCups = freezed,Object? seq = freezed,Object? lang = null,}) {
  return _then(_self.copyWith(
machineOrderNo: null == machineOrderNo ? _self.machineOrderNo : machineOrderNo // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,skuNo: freezed == skuNo ? _self.skuNo : skuNo // ignore: cast_nullable_to_non_nullable
as String?,temp: freezed == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as String?,totalCups: freezed == totalCups ? _self.totalCups : totalCups // ignore: cast_nullable_to_non_nullable
as int?,seq: freezed == seq ? _self.seq : seq // ignore: cast_nullable_to_non_nullable
as int?,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MachineStatus].
extension MachineStatusPatterns on MachineStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MachineStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MachineStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MachineStatus value)  $default,){
final _that = this;
switch (_that) {
case _MachineStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MachineStatus value)?  $default,){
final _that = this;
switch (_that) {
case _MachineStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String machineOrderNo,  String message,  String? skuNo,  String? temp,  int? totalCups,  int? seq,  String lang)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MachineStatus() when $default != null:
return $default(_that.machineOrderNo,_that.message,_that.skuNo,_that.temp,_that.totalCups,_that.seq,_that.lang);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String machineOrderNo,  String message,  String? skuNo,  String? temp,  int? totalCups,  int? seq,  String lang)  $default,) {final _that = this;
switch (_that) {
case _MachineStatus():
return $default(_that.machineOrderNo,_that.message,_that.skuNo,_that.temp,_that.totalCups,_that.seq,_that.lang);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String machineOrderNo,  String message,  String? skuNo,  String? temp,  int? totalCups,  int? seq,  String lang)?  $default,) {final _that = this;
switch (_that) {
case _MachineStatus() when $default != null:
return $default(_that.machineOrderNo,_that.message,_that.skuNo,_that.temp,_that.totalCups,_that.seq,_that.lang);case _:
  return null;

}
}

}

/// @nodoc


class _MachineStatus implements MachineStatus {
  const _MachineStatus({required this.machineOrderNo, required this.message, this.skuNo, this.temp, this.totalCups, this.seq, this.lang = ''});
  

@override final  String machineOrderNo;
@override final  String message;
@override final  String? skuNo;
@override final  String? temp;
@override final  int? totalCups;
@override final  int? seq;
// Raw language code ("en"/"ja"/"ko"/"zh") this message was resolved in —
// see AppFonts.fontFamilyForLanguage, used by StatusBar to pick the
// right font for [message].
@override@JsonKey() final  String lang;

/// Create a copy of MachineStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MachineStatusCopyWith<_MachineStatus> get copyWith => __$MachineStatusCopyWithImpl<_MachineStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MachineStatus&&(identical(other.machineOrderNo, machineOrderNo) || other.machineOrderNo == machineOrderNo)&&(identical(other.message, message) || other.message == message)&&(identical(other.skuNo, skuNo) || other.skuNo == skuNo)&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.totalCups, totalCups) || other.totalCups == totalCups)&&(identical(other.seq, seq) || other.seq == seq)&&(identical(other.lang, lang) || other.lang == lang));
}


@override
int get hashCode => Object.hash(runtimeType,machineOrderNo,message,skuNo,temp,totalCups,seq,lang);

@override
String toString() {
  return 'MachineStatus(machineOrderNo: $machineOrderNo, message: $message, skuNo: $skuNo, temp: $temp, totalCups: $totalCups, seq: $seq, lang: $lang)';
}


}

/// @nodoc
abstract mixin class _$MachineStatusCopyWith<$Res> implements $MachineStatusCopyWith<$Res> {
  factory _$MachineStatusCopyWith(_MachineStatus value, $Res Function(_MachineStatus) _then) = __$MachineStatusCopyWithImpl;
@override @useResult
$Res call({
 String machineOrderNo, String message, String? skuNo, String? temp, int? totalCups, int? seq, String lang
});




}
/// @nodoc
class __$MachineStatusCopyWithImpl<$Res>
    implements _$MachineStatusCopyWith<$Res> {
  __$MachineStatusCopyWithImpl(this._self, this._then);

  final _MachineStatus _self;
  final $Res Function(_MachineStatus) _then;

/// Create a copy of MachineStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? machineOrderNo = null,Object? message = null,Object? skuNo = freezed,Object? temp = freezed,Object? totalCups = freezed,Object? seq = freezed,Object? lang = null,}) {
  return _then(_MachineStatus(
machineOrderNo: null == machineOrderNo ? _self.machineOrderNo : machineOrderNo // ignore: cast_nullable_to_non_nullable
as String,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,skuNo: freezed == skuNo ? _self.skuNo : skuNo // ignore: cast_nullable_to_non_nullable
as String?,temp: freezed == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as String?,totalCups: freezed == totalCups ? _self.totalCups : totalCups // ignore: cast_nullable_to_non_nullable
as int?,seq: freezed == seq ? _self.seq : seq // ignore: cast_nullable_to_non_nullable
as int?,lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
