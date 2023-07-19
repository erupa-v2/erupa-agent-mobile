import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Authenticate and create a user
class CreateUser implements UseCase<User, ObjectParams<User>> {
  /// Constructor
  CreateUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(ObjectParams<User> params) =>
      repository.create(params.value);
}
