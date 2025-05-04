part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final ResponseUserModel responseUserModel;

  LoginSuccess(this.responseUserModel);
}

final class LoginFailure extends LoginState {
  final Failure failure;

  LoginFailure(this.failure);
}
