// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Request _$RequestFromJson(Map<String, dynamic> json) {
  return _Request.fromJson(json);
}

/// @nodoc
mixin _$Request {
  /// Firebase document ID
  String get id => throw _privateConstructorUsedError;

  /// The specific service being requested.
  Service get service => throw _privateConstructorUsedError;

  /// An optional message providing additional details about the request.
  String get message => throw _privateConstructorUsedError;

  /// The user making the request.
  Profile get creator => throw _privateConstructorUsedError;

  /// The agent who will provide the service.
  Agent get agent => throw _privateConstructorUsedError;

  /// Status of the request
  List<RequestStatusLog> get status => throw _privateConstructorUsedError;

  /// Notifications associated with the request
  List<Notification> get notifications => throw _privateConstructorUsedError;

  /// The creation date of the request
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestCopyWith<Request> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestCopyWith<$Res> {
  factory $RequestCopyWith(Request value, $Res Function(Request) then) =
      _$RequestCopyWithImpl<$Res, Request>;
  @useResult
  $Res call(
      {String id,
      Service service,
      String message,
      Profile creator,
      Agent agent,
      List<RequestStatusLog> status,
      List<Notification> notifications,
      String date});

  $ServiceCopyWith<$Res> get service;
  $ProfileCopyWith<$Res> get creator;
  $AgentCopyWith<$Res> get agent;
}

/// @nodoc
class _$RequestCopyWithImpl<$Res, $Val extends Request>
    implements $RequestCopyWith<$Res> {
  _$RequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? service = null,
    Object? message = null,
    Object? creator = null,
    Object? agent = null,
    Object? status = null,
    Object? notifications = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Profile,
      agent: null == agent
          ? _value.agent
          : agent // ignore: cast_nullable_to_non_nullable
              as Agent,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<RequestStatusLog>,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceCopyWith<$Res> get service {
    return $ServiceCopyWith<$Res>(_value.service, (value) {
      return _then(_value.copyWith(service: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get creator {
    return $ProfileCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AgentCopyWith<$Res> get agent {
    return $AgentCopyWith<$Res>(_value.agent, (value) {
      return _then(_value.copyWith(agent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RequestCopyWith<$Res> implements $RequestCopyWith<$Res> {
  factory _$$_RequestCopyWith(
          _$_Request value, $Res Function(_$_Request) then) =
      __$$_RequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Service service,
      String message,
      Profile creator,
      Agent agent,
      List<RequestStatusLog> status,
      List<Notification> notifications,
      String date});

  @override
  $ServiceCopyWith<$Res> get service;
  @override
  $ProfileCopyWith<$Res> get creator;
  @override
  $AgentCopyWith<$Res> get agent;
}

/// @nodoc
class __$$_RequestCopyWithImpl<$Res>
    extends _$RequestCopyWithImpl<$Res, _$_Request>
    implements _$$_RequestCopyWith<$Res> {
  __$$_RequestCopyWithImpl(_$_Request _value, $Res Function(_$_Request) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? service = null,
    Object? message = null,
    Object? creator = null,
    Object? agent = null,
    Object? status = null,
    Object? notifications = null,
    Object? date = null,
  }) {
    return _then(_$_Request(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as Profile,
      agent: null == agent
          ? _value.agent
          : agent // ignore: cast_nullable_to_non_nullable
              as Agent,
      status: null == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<RequestStatusLog>,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Request implements _Request {
  const _$_Request(
      {required this.id,
      required this.service,
      required this.message,
      required this.creator,
      required this.agent,
      required final List<RequestStatusLog> status,
      required final List<Notification> notifications,
      required this.date})
      : _status = status,
        _notifications = notifications;

  factory _$_Request.fromJson(Map<String, dynamic> json) =>
      _$$_RequestFromJson(json);

  /// Firebase document ID
  @override
  final String id;

  /// The specific service being requested.
  @override
  final Service service;

  /// An optional message providing additional details about the request.
  @override
  final String message;

  /// The user making the request.
  @override
  final Profile creator;

  /// The agent who will provide the service.
  @override
  final Agent agent;

  /// Status of the request
  final List<RequestStatusLog> _status;

  /// Status of the request
  @override
  List<RequestStatusLog> get status {
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_status);
  }

  /// Notifications associated with the request
  final List<Notification> _notifications;

  /// Notifications associated with the request
  @override
  List<Notification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  /// The creation date of the request
  @override
  final String date;

  @override
  String toString() {
    return 'Request(id: $id, service: $service, message: $message, creator: $creator, agent: $agent, status: $status, notifications: $notifications, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Request &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.agent, agent) || other.agent == agent) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      service,
      message,
      creator,
      agent,
      const DeepCollectionEquality().hash(_status),
      const DeepCollectionEquality().hash(_notifications),
      date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestCopyWith<_$_Request> get copyWith =>
      __$$_RequestCopyWithImpl<_$_Request>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RequestToJson(
      this,
    );
  }
}

abstract class _Request implements Request {
  const factory _Request(
      {required final String id,
      required final Service service,
      required final String message,
      required final Profile creator,
      required final Agent agent,
      required final List<RequestStatusLog> status,
      required final List<Notification> notifications,
      required final String date}) = _$_Request;

  factory _Request.fromJson(Map<String, dynamic> json) = _$_Request.fromJson;

  @override

  /// Firebase document ID
  String get id;
  @override

  /// The specific service being requested.
  Service get service;
  @override

  /// An optional message providing additional details about the request.
  String get message;
  @override

  /// The user making the request.
  Profile get creator;
  @override

  /// The agent who will provide the service.
  Agent get agent;
  @override

  /// Status of the request
  List<RequestStatusLog> get status;
  @override

  /// Notifications associated with the request
  List<Notification> get notifications;
  @override

  /// The creation date of the request
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_RequestCopyWith<_$_Request> get copyWith =>
      throw _privateConstructorUsedError;
}
