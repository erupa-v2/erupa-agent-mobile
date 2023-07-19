import 'package:get_it/get_it.dart';

import 'data/database/user_local_database.dart';
import 'data/database/user_remote_database.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/create.dart';
import 'domain/usecases/logout.dart';
import 'domain/usecases/retrieve.dart';
import 'domain/usecases/update.dart';

void initUser() {
  final sl = GetIt.instance;

  sl

    ///  Inject remote database
    ..registerLazySingleton<UserRemoteDatabase>(UserRemoteDatabaseImpl.new)

    ///  Inject local database
    ..registerLazySingleton<UserLocalDatabase>(
        () => UserLocalDatabaseImpl(sl()))

    /// Inject repository implementation
    ..registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        remoteDatabase: sl(), networkInfo: sl(), localDatabase: sl()))

    /// Inject use-cases implementation
    ..registerLazySingleton(() => UpdateUser(sl()))
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => RetrieveUser(sl()))
    ..registerLazySingleton(() => LogoutUser(sl()));
}
