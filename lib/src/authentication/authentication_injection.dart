import 'package:get_it/get_it.dart';

import 'presentation/bloc/authentication_bloc.dart';

void initAuthentication() {
  final sl = GetIt.instance;

  sl
  /// Bloc
    .registerFactory(() => AuthenticationBloc(createUser: sl(), retrieveUser: sl()));
}