// part 'auth_event.dart';
// part 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvents, AuthStates> {
//  final LoginUsecase _login;
//  AuthBloc({
//    required LoginUsecase login,
//  }) : _login = login, super(AuthInitial()){
//    on<AuthLogin>(_onAuthLogin)
//  }

//   void _onAuthLogin(
//    AuthLogin event,
//    Emitter<AuthStates> emit,
// ) async {
//   final res = await _login(
//     LoginParams(
//        email: event.email,
//        pwd: event.password,
//     ),
//    );

//    res.fold(
//      (l) => emit(AuthFailure(l.message)),
//     (r) => emit(AuthSuccess(entity: r)),
//   );
//  }
// }
