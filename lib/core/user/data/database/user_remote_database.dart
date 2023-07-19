import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/user.dart';

/// Contracts for interacting with database
abstract class UserRemoteDatabase {
  /// Create a new user instance in the database
  Future<User> create(User user);

  /// Updates a specific [User] instance
  Future<User> update(User user);
}

/// Implements [ProfileRemoteDatabase]
class UserRemoteDatabaseImpl implements UserRemoteDatabase {
  @override
  Future<User> update(User profile) async {
    await FirebaseFirestore.instance
        .collection('profiles')
        .doc(profile.id)
        .update(profile.toJson()..remove('date'));
    return profile;
  }

  @override
  Future<User> create(User user) async {
    final date = {'date': FieldValue.serverTimestamp()};
    await FirebaseFirestore.instance
        .collection('profiles')
        .doc(user.id)
        .set(user.toJson()..addAll(date));
    return user;
  }
}
