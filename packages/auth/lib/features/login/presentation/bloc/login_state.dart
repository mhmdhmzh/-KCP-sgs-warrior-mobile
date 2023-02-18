part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class Loading extends LoginState {}

class Error extends LoginState {
  final String message;

  Error({required this.message});
}

class Success extends LoginState {
  final LoginRespEntity resp;

  Success({required this.resp});
}
