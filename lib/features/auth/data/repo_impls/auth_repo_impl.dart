import '../../domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl();

  //?  @override
  //?  Future<Either<Failure, API_RESPONSE_ENTITY>> login({
  //?    required String email,
  //?    required String password,
  //?    //? ...
  //?  }) async {
  //?    return functionToRun(
  //?      () async => await remoteDataSource.login(
  //?        email: email,
  //?        password: password,
  //?      ),
  //?    );
  //?  }

  //?   Future<Either<Failure, API_RESPONSE_ENTITY>> functionToRun(
  //?    Future<API_RESPONSE_ENTITY> Function() fn,
  //?  ) async {
  //?    try {
  //?      if (!await (connectionChecker.isConnected)) {
  //?        return left(Failure("Message"));
  //?      }
  //?      final entityToReturn = await fn();
  //?
  //?      return right(entityToReturn);
  //?    } on ServerException catch (e) {
  //?      return left(Failure(e.message));
  //?    }
  //?  }
}
