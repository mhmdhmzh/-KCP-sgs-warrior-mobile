import 'dart:convert';

import 'package:auth/features/register/domain/entities/register_entity.dart';

class RegisterReqModel extends RegisterReqEntity {
  RegisterReqModel({
    required super.avatar64,
    required super.idCard64,
    required super.name,
    required super.email,
    required super.phone,
    required super.sex,
    required super.dob,
    required super.address,
    required super.subdistrictId,
    required super.placeId,
  });

  factory RegisterReqModel.fromJson(Map<String, dynamic> json) =>
      RegisterReqModel(
        avatar64: json['avatar64'],
        idCard64: json['idCard64'],
        name: json['name'],
        email: json['email'],
        phone: json['phone'],
        sex: json['sex'],
        dob: json['dob'],
        address: json['address'],
        subdistrictId: json['provinceId'],
        placeId: json['placeId'],
      );
}

// To parse this JSON data, do
//
//     final RegisterRespModel = RegisterRespModelFromJson(jsonString);

RegisterRespModel registerRespModelFromJson(String str) =>
    RegisterRespModel.fromJson(json.decode(str));

class RegisterRespModel extends RegisterRespEntity {
  RegisterRespModel({
    required super.message,
    required super.data,
  });

  factory RegisterRespModel.fromJson(Map<String, dynamic> json) =>
      RegisterRespModel(
        message: json["message"],
        data: List<RegisterRespDataModel>.from(
            json["data"].map((x) => RegisterRespDataModel.fromJson(x))),
      );
}

class RegisterRespDataModel extends RegisterRespDataEntity {
  RegisterRespDataModel({
    required super.user,
    required super.profile,
  });

  factory RegisterRespDataModel.fromJson(Map<String, dynamic> json) =>
      RegisterRespDataModel(
        user: UserModel.fromJson(json["user"]),
        profile: ProfileModel.fromJson(json["profile"]),
      );
}

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.id,
    required super.userId,
    required super.code,
    required super.phone,
    required super.address,
    required super.placeId,
    required super.subdistrictId,
    super.postalCode,
    required super.gender,
    required super.birthDate,
    required super.photo,
    required super.photoKtp,
    required super.warpay,
    required super.point,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
    super.deletedAt,
    super.deletedBy,
    super.usrAddrReceiverName,
    super.usrAddrReceiverPhone,
    super.usrAddrPrimary,
    super.usrAddrSubdistrictId,
    super.usrAddrAddress,
    super.usrAddrAddressLabel,
    super.usrAddrPostalCode,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        userId: json["user_id"],
        code: json["code"],
        phone: json["phone"],
        address: json["address"],
        placeId: json["place_id"],
        subdistrictId: json["subdistrict_id"],
        postalCode: json["postal_code"],
        gender: json["gender"],
        birthDate: json["birth_date"],
        photo: json["photo"],
        photoKtp: json["photo_ktp"],
        warpay: json["warpay"],
        point: json["point"],
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        deletedBy: json["deleted_by"],
        usrAddrReceiverName: json["usr_addr_receiver_name"],
        usrAddrReceiverPhone: json["usr_addr_receiver_phone"],
        usrAddrPrimary: json["usr_addr_primary"],
        usrAddrSubdistrictId: json["usr_addr_subdistrict_id"],
        usrAddrAddress: json["usr_addr_address"],
        usrAddrAddressLabel: json["usr_addr_address_label"],
        usrAddrPostalCode: json["usr_addr_postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "code": code,
        "phone": phone,
        "address": address,
        "place_id": placeId,
        "subdistrict_id": subdistrictId,
        "postal_code": postalCode,
        "gender": gender,
        "birth_date": birthDate,
        "photo": photo,
        "photo_ktp": photoKtp,
        "warpay": warpay,
        "point": point,
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt.toIso8601String(),
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "deleted_by": deletedBy,
        "usr_addr_receiver_name": usrAddrReceiverName,
        "usr_addr_receiver_phone": usrAddrReceiverPhone,
        "usr_addr_primary": usrAddrPrimary,
        "usr_addr_subdistrict_id": usrAddrSubdistrictId,
        "usr_addr_address": usrAddrAddress,
        "usr_addr_address_label": usrAddrAddressLabel,
        "usr_addr_postal_code": usrAddrPostalCode,
      };
}

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.fullname,
    required super.email,
    required super.role,
    required super.active,
    super.whId,
    super.deviceToken,
    required super.createdAt,
    required super.createdBy,
    required super.updatedAt,
    required super.updatedBy,
    super.deletedAt,
    super.deletedBy,
    required super.emailConfirmed,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        fullname: json["fullname"],
        email: json["email"],
        role: json["role"],
        active: json["active"],
        whId: json["wh_id"],
        deviceToken: json["device_token"],
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        deletedAt: json["deleted_at"],
        deletedBy: json["deleted_by"],
        emailConfirmed: json["email_confirmed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullname": fullname,
        "email": email,
        "role": role,
        "active": active,
        "wh_id": whId,
        "device_token": deviceToken,
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt.toIso8601String(),
        "updated_by": updatedBy,
        "deleted_at": deletedAt,
        "deleted_by": deletedBy,
        "email_confirmed": emailConfirmed,
      };
}
