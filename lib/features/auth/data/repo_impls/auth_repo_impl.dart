import 'package:fpdart/src/either.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';

import 'package:wasil_flutter_task/core/errors/failures.dart';
import 'package:wasil_flutter_task/features/auth/data/data_sources/auth_data_source.dart';

import 'package:wasil_flutter_task/features/auth/data/models/signup_request_body.dart';

import '../../domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl();

  @override
  Future<Either<Failure, bool>> login(AuthRequestBody request) async {
    try {
      final flag = await serviceLocator<AuthDataSource>()
          .loginWithEmailAndPassword(request: request);
      return right(flag);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> signup(AuthRequestBody request) async {
    try {
      final flag = await serviceLocator<AuthDataSource>()
          .signUpWithEmailAndPassword(request: request);
      return right(flag);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
