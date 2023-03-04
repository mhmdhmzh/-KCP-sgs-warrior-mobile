part of 'pin_bloc.dart';

@immutable
abstract class PinEvent {}

class DoPinCheck extends PinEvent {
  final String email;
  final String token;
  final String pin;
  final bool isCreate;

  DoPinCheck(
      {required this.email,
      required this.pin,
      required this.token,
      required this.isCreate});
}

class DoResendOtp extends PinEvent {
  final String email;

  DoResendOtp({required this.email});
}
