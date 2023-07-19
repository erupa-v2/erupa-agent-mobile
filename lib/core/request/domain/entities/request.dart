import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../agent/domain/entities/agent.dart';
import '../../../notification/domain/entities/notification.dart';
import '../../../profile/domain/entities/profile.dart';
import '../../../service/domain/entities/service.dart';
import 'status.dart';

part 'request.freezed.dart';

part 'request.g.dart';

@freezed
class Request with _$Request {
  const factory Request({
    /// Firebase document ID
    required String id,

    /// The specific service being requested.
    required Service service,

    /// An optional message providing additional details about the request.
    required String message,

    /// The user making the request.
    required Profile creator,

    /// The agent who will provide the service.
    required Agent agent,

    /// Status of the request
    required List<RequestStatusLog> status,

    /// Notifications associated with the request
    required List<Notification> notifications,

    /// The creation date of the request
    required String date,
  }) = _Request;

  /// Converts json to dart object
  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  /// Initial user dummy data
  factory Request.initial() => Request(
        creator: Profile.initial(),
        agent: Agent.initial(),
        service: Service.initial(),
        notifications: [],
        status: [],
        message: '',
        date: '',
        id: '',
      );
}
