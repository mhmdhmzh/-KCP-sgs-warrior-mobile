import 'dart:convert';

import 'package:auth/features/otp/domain/entities/otp_entity.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel extends UserEntity {
  UserModel({
    required super.message,
    required super.code,
    required super.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        code: json["code"],
        data: UserDataModel.fromJson(json["data"]),
      );
}

class UserDataModel extends UserDataEntity {
  UserDataModel({
    required super.user,
    required super.profile,
    required super.token,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        user: UserDetailModel.fromJson(json["user"]),
        profile: UserProfileModel.fromJson(json["profile"]),
        token: json["token"],
      );
}

class UserProfileModel extends UserProfileEntity {
  UserProfileModel({
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

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
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

class UserDetailModel extends UserDetailEntity {
  UserDetailModel({
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
    required super.warehouseId,
    required super.warehouseName,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      UserDetailModel(
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
        warehouseId: json["warehouse_id"],
        warehouseName: json["warehouse_name"],
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
        "warehouse_id": warehouseId,
        "warehouse_name": warehouseName,
      };
}
