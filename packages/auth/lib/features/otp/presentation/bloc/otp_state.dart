part of 'otp_bloc.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class Loading extends OtpState {}

class Error extends OtpState {
  final String message;

  Error({required this.message});
}

class Success extends OtpState {
  final UserEntity resp;

  Success({required this.resp});
}
