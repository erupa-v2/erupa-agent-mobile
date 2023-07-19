import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../shared/error/exception.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/platform/network_info.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../database/profile_remote_database.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  /// Constructor
  ProfileRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatabase,
  });

  /// Dependencies
  NetworkInfo networkInfo;
  ProfileRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Profile>> update(Profile user) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.update(user);
      return Right(results);
    } on FirebaseAuthException catch (error) {
      return Left(Failure(error.message!));
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    } on FirebaseException catch (error) {
      return Left(Failure(error.message!));
    }
  }

  @override
  Future<Either<Failure, Profile>> retrieve(String profileID) async {
    try {
      final result = await remoteDatabase.retrieve(profileID);
      return Right(result);
    } on FirebaseAuthException catch (error) {
      return Left(Failure(error.message!));
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    } on FirebaseException catch (error) {
      return Left(Failure(error.message!));
    }
  }
}
