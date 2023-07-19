// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$$_NotificationFromJson(Map<String, dynamic> json) =>
    _$_Notification(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      recipient: Profile.fromJson(json['recipient'] as Map<String, dynamic>),
      read: json['read'] as bool,
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'recipient': instance.recipient,
      'read': instance.read,
      'date': instance.date,
    };
