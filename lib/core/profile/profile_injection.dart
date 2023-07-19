import 'package:get_it/get_it.dart';

import 'data/database/profile_remote_database.dart';
import 'data/repositories/profile_repository_impl.dart';
import 'domain/repositories/profile_repository.dart';
import 'domain/usecases/retrieve.dart';
import 'domain/usecases/update.dart';

void initProfile() {
  final sl = GetIt.instance;

  sl
  ///  Inject remote database
    ..registerLazySingleton<ProfileRemoteDatabase>(ProfileRemoteDatabaseImpl.new)

  /// Inject repository implementation
    ..registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(
        remoteDatabase: sl(), networkInfo: sl()))

  /// Inject use-cases implementation
    ..registerLazySingleton(() => UpdateProfile(sl()))
    ..registerLazySingleton(() => RetrieveProfile(sl()));
}