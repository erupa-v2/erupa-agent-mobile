import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/profile.dart';

/// Contracts for interacting with database
abstract class ProfileRemoteDatabase {
  /// Retrieves a profile instance from the database
  Future<Profile> retrieve(String profileId);

  /// Updates a specific [Profile] instance
  Future<Profile> update(Profile profile);
}

/// Implements [ProfileRemoteDatabase]
class ProfileRemoteDatabaseImpl implements ProfileRemoteDatabase {
  @override
  Future<Profile> update(Profile profile) async {
    await FirebaseFirestore.instance
        .collection('profiles')
        .doc(profile.id)
        .update(profile.toJson()..remove('date'));
    return profile;
  }

  @override
  Future<Profile> retrieve(String profileId) async {
    final document = await FirebaseFirestore.instance
        .collection('profiles')
        .doc(profileId)
        .get();
    return Profile.fromJson(document.data()!);
  }
}
