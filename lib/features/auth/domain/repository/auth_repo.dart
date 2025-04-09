import 'package:fpdart/fpdart.dart';
import 'package:wasil_flutter_task/core/errors/failures.dart';
import 'package:wasil_flutter_task/features/auth/data/models/signup_request_body.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, bool>> login(AuthRequestBody request);
  Future<Either<Failure, bool>> signup(AuthRequestBody request);
}
