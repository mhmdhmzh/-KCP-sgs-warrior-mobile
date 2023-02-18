import 'package:auth/features/login/domain/entities/login_req_entity.dart';

class LoginReqModel extends LoginReqEntity {
  LoginReqModel({required super.email, required super.media});

  factory LoginReqModel.fromJson(Map<String, dynamic> json) {
    return LoginReqModel(email: json['email'], media: json['media']);
  }
}
