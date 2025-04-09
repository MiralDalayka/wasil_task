import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasil_flutter_task/app/get_it/get_it.dart';
import 'package:wasil_flutter_task/app/layout/layout.dart';
import 'package:wasil_flutter_task/core/common/services/router/app_router.dart';
import 'package:wasil_flutter_task/features/auth/data/data_sources/auth_data_source.dart';
import 'package:wasil_flutter_task/features/auth/data/models/signup_request_body.dart';
import 'package:wasil_flutter_task/features/auth/presentation/screens/registration_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  bool isSignedIn = false;
  //
  void authMode(Widget screen) async {
    bool isSignedIn = await serviceLocator<AuthDataSource>().isUserSignedIn();
    if (isSignedIn) {
      AppRouter.push(screen: screen);
    } else {
      //show pop to sign in
      AppRouter.push(screen: RegistrationScreen());
    }
  }

  void signUpWithGoogle() {
    serviceLocator<AuthDataSource>().signinWithGoogle();
    isSignedIn = true;
    AuthUpdated();
  }

  Future<void> signUpWithEmail(String email, password) async {
    await serviceLocator<AuthDataSource>()
        .signUpWithEmailAndPassword(
          request: AuthRequestBody(email: email, password: password),
        )
        .whenComplete(AppRouter.pushReplace(screen: Layout()));
    isSignedIn = true;
    AuthUpdated();
  }

  void logInWithEmail(String email, password) {
    serviceLocator<AuthDataSource>()
        .loginWithEmailAndPassword(
          request: AuthRequestBody(email: email, password: password),
        )
        .whenComplete(AppRouter.pushReplace(screen: Layout()));
    isSignedIn = true;
    AuthUpdated();
  }

  void logout() {
    serviceLocator<AuthDataSource>().logout();
    isSignedIn = false;
    AuthUpdated();
  }
}
