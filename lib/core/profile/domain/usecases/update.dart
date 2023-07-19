import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';
import '../entities/profile.dart';
import '../repositories/profile_repository.dart';

/// Update profile credentials
class UpdateProfile implements UseCase<Profile, ObjectParams<Profile>> {
  /// Constructor
  UpdateProfile(this.repository);

  /// Repository
  final ProfileRepository repository;

  @override
  Future<Either<Failure, Profile>> call(ObjectParams params) =>
      repository.update(params.value);
}
