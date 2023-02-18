import 'package:core/core.dart';

class LoginReqEntity extends Equatable {
  final String email;
  final String media;

  LoginReqEntity({required this.email, required this.media});

  @override
  List<Object?> get props => [email, media];
}
