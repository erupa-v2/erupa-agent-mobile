import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

enum ServiceCategory {
  identity,
  business,
  education,
  immigration,
  property,
}

@freezed
class Service with _$Service {
  factory Service({
    /// Service document id
    required String id,

    /// Service name
    required String name,

    /// Service description
    required String description,

    /// Category of service
    required ServiceCategory category,

    /// Price charged for service
    required double price,

    /// Service created date
    required String date,
  }) = _Service;

  /// Private constructor
  const Service._();

  /// Returns the first 5 characters of the user id
  String get categoryName => category.name;

  /// Converts json to dart object
  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  /// Initial user dummy data
  factory Service.initial() => Service(
        id: '',
        name: '',
        description: '',
        date: '',
        category: ServiceCategory.identity,
        price: 0.0,
      );
}
