part of 'auth_cubit.dart';

sealed class AuthStates {
  const AuthStates();
}

final class AuthInitial extends AuthStates {}

final class AuthLoading extends AuthStates {}

final class AuthSuccess extends AuthStates {
  //  final ENTITY? entity;
  // const AuthSuccess({this.entity});
}

final class AuthFailure extends AuthStates {
  final String? message;
  const AuthFailure({this.message});
}

final class AuthUpdated extends AuthStates {}
