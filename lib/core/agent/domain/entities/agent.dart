import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../profile/domain/entities/profile.dart';
import '../../../service/domain/entities/service.dart';
import 'contact.dart';

part 'agent.freezed.dart';

part 'agent.g.dart';

@freezed
class Agent with _$Agent {
  const factory Agent({
    /// This is a unique identifier for the agent.
    required String id,

    /// User profile of the agent
    required Profile creator,

    /// This is the name of the agent.
    required String name,

    /// This is a list of services that the agent can provide.
    required List<Service> services,

    /// Public contact
    required Contact contact,
  }) = _Agent;

  /// Converts json to dart object
  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  /// Initial user dummy data
  factory Agent.initial() => Agent(
        id: '',
        creator: Profile.initial(),
        name: '',
        services: [],
        contact: Contact.initial(),
      );
}
