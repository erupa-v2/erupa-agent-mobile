// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RequestStatusLog _$RequestStatusLogFromJson(Map<String, dynamic> json) {
  return _RequestStatusLog.fromJson(json);
}

/// @nodoc
mixin _$RequestStatusLog {
  /// Status of the transaction
  RequestStatus get status => throw _privateConstructorUsedError;

  /// Date transaction status was updated
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestStatusLogCopyWith<RequestStatusLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStatusLogCopyWith<$Res> {
  factory $RequestStatusLogCopyWith(
          RequestStatusLog value, $Res Function(RequestStatusLog) then) =
      _$RequestStatusLogCopyWithImpl<$Res, RequestStatusLog>;
  @useResult
  $Res call({RequestStatus status, String date});
}

/// @nodoc
class _$RequestStatusLogCopyWithImpl<$Res, $Val extends RequestStatusLog>
    implements $RequestStatusLogCopyWith<$Res> {
  _$RequestStatusLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestStatusLogCopyWith<$Res>
    implements $RequestStatusLogCopyWith<$Res> {
  factory _$$_RequestStatusLogCopyWith(
          _$_RequestStatusLog value, $Res Function(_$_RequestStatusLog) then) =
      __$$_RequestStatusLogCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestStatus status, String date});
}

/// @nodoc
class __$$_RequestStatusLogCopyWithImpl<$Res>
    extends _$RequestStatusLogCopyWithImpl<$Res, _$_RequestStatusLog>
    implements _$$_RequestStatusLogCopyWith<$Res> {
  __$$_RequestStatusLogCopyWithImpl(
      _$_RequestStatusLog _value, $Res Function(_$_RequestStatusLog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? date = null,
  }) {
    return _then(_$_RequestStatusLog(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RequestStatusLog implements _RequestStatusLog {
  const _$_RequestStatusLog({required this.status, required this.date});

  factory _$_RequestStatusLog.fromJson(Map<String, dynamic> json) =>
      _$$_RequestStatusLogFromJson(json);

  /// Status of the transaction
  @override
  final RequestStatus status;

  /// Date transaction status was updated
  @override
  final String date;

  @override
  String toString() {
    return 'RequestStatusLog(status: $status, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestStatusLog &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestStatusLogCopyWith<_$_RequestStatusLog> get copyWith =>
      __$$_RequestStatusLogCopyWithImpl<_$_RequestStatusLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestStatusLogToJson(
      this,
    );
  }
}

abstract class _RequestStatusLog implements RequestStatusLog {
  const factory _RequestStatusLog(
      {required final RequestStatus status,
      required final String date}) = _$_RequestStatusLog;

  factory _RequestStatusLog.fromJson(Map<String, dynamic> json) =
      _$_RequestStatusLog.fromJson;

  @override

  /// Status of the transaction
  RequestStatus get status;
  @override

  /// Date transaction status was updated
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_RequestStatusLogCopyWith<_$_RequestStatusLog> get copyWith =>
      throw _privateConstructorUsedError;
}
