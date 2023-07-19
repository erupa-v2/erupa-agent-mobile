import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';

/// Update user credentials
class UpdateUser implements UseCase<User, ObjectParams<User>> {
  /// Constructor
  UpdateUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(ObjectParams params) =>
      repository.update(params.value);
}
