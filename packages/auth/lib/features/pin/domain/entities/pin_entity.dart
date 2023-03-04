import 'package:core/core.dart';

class PinRespEntity extends Equatable {
  PinRespEntity({
    required this.message,
    required this.data,
  });

  final String message;
  final PinRespDataEntity data;

  @override
  List<Object?> get props => [message, data];
}

class PinRespDataEntity extends Equatable {
  PinRespDataEntity({
    required this.token,
    required this.email,
    required this.pin,
  });

  final String token;
  final String email;
  final String pin;

  @override
  List<Object?> get props => [token, email];
}
