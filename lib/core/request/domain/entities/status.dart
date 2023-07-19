import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
class RequestStatusLog with _$RequestStatusLog {
  const factory RequestStatusLog({

    /// Status of the transaction
    required RequestStatus status,

    /// Date transaction status was updated
    required String date,

  }) = _RequestStatusLog;

  /// Deserialize json to [RequestStatusLog] instance
  factory RequestStatusLog.fromJson(Map<String, dynamic> json) =>
      _$RequestStatusLogFromJson(json);

  /// [RequestStatusLog] dummy date -> Meant for extension with copyWith
  factory RequestStatusLog.initial() => const RequestStatusLog(
    status: RequestStatus.pending,
    date: '',
  );
}

/// How event organizers collect tickets payments
enum RequestStatus {
  // Payment yet to be processed
  pending,

  // Payment has been processed and failed
  accepted,

  // Payment has been processed and successful
  declined,
}
