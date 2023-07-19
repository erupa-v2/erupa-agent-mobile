import 'package:dartz/dartz.dart';

import '../../../../core/user/data/database/user_local_database.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/usecases/create.dart';
import '../../../../core/user/domain/usecases/retrieve.dart';
import '../../../../injection_container.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';

class AuthenticationBloc {
  /// Constructor
  const AuthenticationBloc({
    required this.createUser,
    required this.retrieveUser,
  });

  /// Creates a [User] instance in the database
  final CreateUser createUser;

  /// Retrieve a user from local database
  final RetrieveUser retrieveUser;

  /// Implementation of [createUser]
  Future<Either<Failure, User>> createNewUser(User user) async {
    final result = await createUser(ObjectParams<User>(user));
    return result;
  }

  /// Implementation of [retrieveUser]
  Future<bool> retrieveExistingUser() async {
    final result = await retrieveUser(NoParams());
    return result.fold((failure) => false, (success) {
      return success.id.isNotEmpty;
    });
  }

  /// Save user to local database
  Future<void> persistUserData(User user) async {
    await sl<UserLocalDatabase>().cache(user);
  }
}
