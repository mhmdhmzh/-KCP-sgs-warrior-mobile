part of 'otp_bloc.dart';

@immutable
abstract class OtpEvent {}

class DoOtpCheck extends OtpEvent {
  final String email;
  final String otp;
  final String type;

  DoOtpCheck({required this.email, required this.otp, required this.type});
}
