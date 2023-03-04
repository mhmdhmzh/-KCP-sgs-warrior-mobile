part of 'pin_bloc.dart';

@immutable
abstract class PinState {}

class PinInitial extends PinState {}

class Loading extends PinState {}

class Success extends PinState {
  final PinRespEntity pinRespEntity;

  Success({required this.pinRespEntity});
}

class Error extends PinState {
  final String message;

  Error({required this.message});
}

// resend otp

class ResendOTPSuccess extends PinState {
  final bool isSuccess;

  ResendOTPSuccess({required this.isSuccess});
}

class ResendOTPError extends PinState {
  final String message;

  ResendOTPError({required this.message});
}

class Empty extends PinState {}
