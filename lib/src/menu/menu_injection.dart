import 'package:get_it/get_it.dart';
import 'presentation/bloc/menu_bloc.dart';

void initMenu() {
  final sl = GetIt.instance;
  sl

      /// Bloc
      .registerFactory(() => MenuBloc(retrieveUser: sl(), updateUser: sl()));
}
