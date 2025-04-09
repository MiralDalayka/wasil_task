import 'package:fpdart/fpdart.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/core/errors/failures.dart';
import 'package:wasil_flutter_task/core/usecase/usecase.dart';
import 'package:wasil_flutter_task/features/auth/data/models/signup_request_body.dart';
import 'package:wasil_flutter_task/features/auth/domain/repository/auth_repo.dart';

class LoginUseCase implements Usecase<bool, AuthRequestBody> {
  const LoginUseCase();
  @override
  Future<Either<Failure, bool>> call(AuthRequestBody request) async {
    return await serviceLocator<AuthRepo>().login(request);
  }
}
