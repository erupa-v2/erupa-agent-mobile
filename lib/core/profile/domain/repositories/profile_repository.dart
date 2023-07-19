import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/profile.dart';

/// Handles Profile data
abstract class ProfileRepository {
  /// Retrieves a profile instance from the database
  Future<Either<Failure, Profile>> retrieve(String profileId);

  /// Update profile info
  Future<Either<Failure, Profile>> update(Profile profile);
}
