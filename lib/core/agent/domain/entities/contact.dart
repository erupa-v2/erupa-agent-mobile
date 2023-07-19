import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class Contact with _$Contact {
  const factory Contact({
    /// The phone number associated with the contact.
    required String phone,

    /// The email address associated with the contact.
    required String email,

    /// The website URL associated with the contact.
   required String website,

    /// The Facebook profile URL associated with the contact.
   required String facebook,

    /// The Twitter profile URL associated with the contact.
    required String twitter,

    /// The Instagram profile URL associated with the contact.
   required String instagram,

  }) = _Contact;

  /// Converts json to dart object
  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

  /// Initial user dummy data
  factory Contact.initial() => const Contact(
    phone: '',
    email: '',
    website: '',
    facebook: '',
    twitter: '',
    instagram: '',
  );
}
