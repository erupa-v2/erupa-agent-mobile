import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/profile/domain/entities/profile.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  /// Constructor
  const factory Notification({
    /// Firebase document ID
    required String id,

    /// Notification Title
    required String title,

    /// Notification Message
    required String message,

    /// Receiving the notification
    required Profile recipient,

    /// Determines if the notification has been read
    required bool read,

    /// Date created
    required String date,
  }) = _Notification;

  /// Convert from json to model
  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  /// Initial state with dummy data
  factory Notification.initial() => Notification(
        id: '',
        message: '',
        date: '',
        recipient: Profile.initial(),
        title: '',
        read: false,
      );
}
