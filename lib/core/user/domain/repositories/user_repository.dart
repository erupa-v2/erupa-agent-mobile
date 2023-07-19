import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/user.dart';

/// Handles User data
abstract class UserRepository {
  /// Creates a new user instance in the database
  Future<Either<Failure, User>> create(User user);

  /// Retrieve user information
  Future<Either<Failure, User>> retrieve();

  /// Update user info
  Future<Either<Failure, User>> update(User user);

  /// Logs user out of account
  Future<Either<Failure, User>> logout();
}
