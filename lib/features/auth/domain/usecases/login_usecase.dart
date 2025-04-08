// class LoginUsecase implements Usecase<ENTITY, LoginParams> {
//   final AuthRepo authRepo;
//   const LoginUsecase({this.authRepo});

//   @override
//   Future<Either<Failure, ENTITY>> call(LoginParams params) async {
//     return await authRepo.login(
//       email: params.email,
//       pwd: params.pwd,
//     );
//   }
// }

// class LoginParams {  final String email;
// final String pwd;

//  LoginParams({required this.email, required this.pwd});
// }
