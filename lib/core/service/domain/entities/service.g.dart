// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Service _$$_ServiceFromJson(Map<String, dynamic> json) => _$_Service(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      category: $enumDecode(_$ServiceCategoryEnumMap, json['category']),
      price: (json['price'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$$_ServiceToJson(_$_Service instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': _$ServiceCategoryEnumMap[instance.category]!,
      'price': instance.price,
      'date': instance.date,
    };

const _$ServiceCategoryEnumMap = {
  ServiceCategory.identity: 'identity',
  ServiceCategory.business: 'business',
  ServiceCategory.education: 'education',
  ServiceCategory.immigration: 'immigration',
  ServiceCategory.property: 'property',
};
