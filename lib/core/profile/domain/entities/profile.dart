import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

// flutter packages run build_runner build --delete-conflicting-outputs
@freezed
class Profile with _$Profile {
  /// Constructor
  factory Profile({
    ///  Unique database ID -> [id]
    required String id,

    /// username associated to the user
    required String username,

    /// Phone number for authentication.
    required String phone,

    /// Photo associated to the user
    required String photo,

    /// For push notification
    required String fcm,
  }) = _Profile;

  /// Private constructor
  const Profile._();

  /// Returns the first 5 characters of the user id
  String get code => id.substring(0, 5);

  /// Converts json to dart object
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  /// Initial user dummy data
  factory Profile.initial() => Profile(
        id: '',
        phone: '',
        username: '',
        fcm: '',
        photo:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjQuWoYxxguqd9waQVKj8XOIwBScGgTKqcEQ&usqp=CAU',
      );
}
