import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../shared/data/hive_adapters.dart';

part 'user.freezed.dart';

part 'user.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@HiveType(typeId: HiveAdapters.user)
@freezed
class User with _$User {
  /// Constructor
  factory User({
    ///  Unique database ID -> [id]
    @HiveField(0) required String id,

    /// Username associated to the user
    @HiveField(1) required String username,

    /// Phone number for authentication.
    @HiveField(2) required String phoneNumber,

    /// Photo associated to the user
    @HiveField(3) required String photo,

    /// For push notification
    @HiveField(4) required String fcmToken,
  }) = _User;

  /// Private constructor
  const User._();

  /// Returns the first 5 characters of the user id
  String get code => id.substring(0, 5);

  /// Converts json to dart object
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Initial user dummy data
  factory User.initial() => User(
        id: '',
        phoneNumber: '',
        username: '',
        fcmToken: '',
        photo:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU',
      );
}
