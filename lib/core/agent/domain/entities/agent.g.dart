// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names, duplicate_ignore

part of 'agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Agent _$$_AgentFromJson(Map<String, dynamic> json) => _$_Agent(
      id: json['id'] as String,
      creator: Profile.fromJson(json['creator'] as Map<String, dynamic>),
      name: json['name'] as String,
      services: (json['services'] as List<dynamic>)
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      contact: Contact.fromJson(json['contact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AgentToJson(_$_Agent instance) => <String, dynamic>{
      'id': instance.id,
      'creator': instance.creator,
      'name': instance.name,
      'services': instance.services,
      'contact': instance.contact,
    };
