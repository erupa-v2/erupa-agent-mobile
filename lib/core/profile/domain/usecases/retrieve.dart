import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

/// Retrieve a profile from the database
class RetrieveProfile implements UseCase<Profile, ObjectParams<String>> {
  /// Constructor
  RetrieveProfile(this.repository);

  /// Repository
  final ProfileRepository repository;

  @override
  Future<Either<Failure, Profile>> call(ObjectParams params) =>
      repository.retrieve(params.value);
}
