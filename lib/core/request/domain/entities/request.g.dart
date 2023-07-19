// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Request _$$_RequestFromJson(Map<String, dynamic> json) => _$_Request(
      id: json['id'] as String,
      service: Service.fromJson(json['service'] as Map<String, dynamic>),
      message: json['message'] as String,
      creator: Profile.fromJson(json['creator'] as Map<String, dynamic>),
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      status: (json['status'] as List<dynamic>)
          .map((e) => RequestStatusLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      notifications: (json['notifications'] as List<dynamic>)
          .map((e) => Notification.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_RequestToJson(_$_Request instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service': instance.service,
      'message': instance.message,
      'creator': instance.creator,
      'agent': instance.agent,
      'status': instance.status,
      'notifications': instance.notifications,
      'date': instance.date,
    };
