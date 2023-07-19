// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestStatusLog _$$_RequestStatusLogFromJson(Map<String, dynamic> json) =>
    _$_RequestStatusLog(
      status: $enumDecode(_$RequestStatusEnumMap, json['status']),
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_RequestStatusLogToJson(_$_RequestStatusLog instance) =>
    <String, dynamic>{
      'status': _$RequestStatusEnumMap[instance.status]!,
      'date': instance.date,
    };

const _$RequestStatusEnumMap = {
  RequestStatus.pending: 'pending',
  RequestStatus.accepted: 'accepted',
  RequestStatus.declined: 'declined',
};
