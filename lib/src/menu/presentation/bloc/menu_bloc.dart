import 'package:dartz/dartz.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/domain/usecases/retrieve.dart';
import '../../../../core/user/domain/usecases/update.dart';
import '../../../../shared/error/failure.dart';
import '../../../../shared/usecase/usecase.dart';

class MenuBloc {
  /// Constructor
  const MenuBloc({
    required this.retrieveUser,
    required this.updateUser,
  });

  /// Retrieve a user from local database
  final RetrieveUser retrieveUser;

  /// Updates a user's details both remotely and locally
  final UpdateUser updateUser;

  /// Implementation of [RetrieveUser]
  Future<Either<Failure, User>> retrieveUserData() async {
    final result = await retrieveUser(NoParams());
    return result;
  }

  /// Implementation of [UpdateUser]
  Future<Either<Failure, User>> updateUserData({required User user}) async {
    final result = await updateUser(ObjectParams<User>(user));
    return result;
  }
}
