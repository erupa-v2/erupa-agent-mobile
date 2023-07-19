import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/user.dart';
import '../repositories/user_repository.dart';


/// Authenticate and create a user
class RetrieveUser implements UseCase<User, NoParams> {
  /// Constructor
  RetrieveUser(this.repository);

  /// Repository
  final UserRepository repository;

  @override
  Future<Either<Failure, User>> call(NoParams params) =>
      repository.retrieve();
}
