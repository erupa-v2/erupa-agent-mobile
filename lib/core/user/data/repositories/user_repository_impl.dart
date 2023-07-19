import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../shared/error/exception.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/platform/network_info.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../database/user_local_database.dart';
import '../database/user_remote_database.dart';

class UserRepositoryImpl implements UserRepository {
  /// Constructor
  UserRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatabase,
    required this.localDatabase,
  });

  /// Dependencies
  NetworkInfo networkInfo;
  UserRemoteDatabase remoteDatabase;
  UserLocalDatabase localDatabase;

  @override
  Future<Either<Failure, User>> update(User user) async {
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
  Future<Either<Failure, User>> create(User user) async {
    try {
      await networkInfo.hasInternet();
      final fcmToken = await FirebaseMessaging.instance.getToken();
      final results =
          await remoteDatabase.create(user.copyWith(fcmToken: fcmToken!));
      await localDatabase.cache(results);
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
  Future<Either<Failure, User>> logout() async {
    try {
      final result = User.initial();
      await localDatabase.cache(result);
      return Right(result);
    } on FirebaseAuthException catch (error) {
      return Left(Failure(error.message!));
    } on DeviceException catch (error) {
      return Left(Failure(error.message));
    } on FirebaseException catch (error) {
      return Left(Failure(error.message!));
    }
  }

  @override
  Future<Either<Failure, User>> retrieve() async {
    try {
      final result = await localDatabase.retrieve();
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
