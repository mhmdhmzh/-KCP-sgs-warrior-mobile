import 'dart:convert';

import 'package:core/core.dart';

class UserEntity extends Equatable {
  UserEntity({
    required this.message,
    required this.code,
    required this.data,
  });

  final String message;
  final int code;
  final UserDataEntity data;

  @override
  List<Object?> get props => [message, code];
}

class UserDataEntity extends Equatable {
  UserDataEntity({
    required this.user,
    required this.profile,
    required this.token,
  });

  final UserDetailEntity user;
  final UserProfileEntity profile;
  final String token;

  @override
  List<Object?> get props => [user, profile];
}

class UserProfileEntity extends Equatable {
  UserProfileEntity({
    required this.id,
    required this.userId,
    required this.code,
    required this.phone,
    required this.address,
    required this.placeId,
    required this.subdistrictId,
    this.postalCode,
    required this.gender,
    required this.birthDate,
    required this.photo,
    required this.photoKtp,
    required this.warpay,
    required this.point,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    this.deletedAt,
    this.deletedBy,
    this.usrAddrReceiverName,
    this.usrAddrReceiverPhone,
    this.usrAddrPrimary,
    this.usrAddrSubdistrictId,
    this.usrAddrAddress,
    this.usrAddrAddressLabel,
    this.usrAddrPostalCode,
  });

  final int id;
  final int userId;
  final String code;
  final String phone;
  final String address;
  final int placeId;
  final int subdistrictId;
  final dynamic postalCode;
  final String gender;
  final String birthDate;
  final String photo;
  final String photoKtp;
  final int warpay;
  final int point;
  final DateTime createdAt;
  final int createdBy;
  final DateTime updatedAt;
  final int updatedBy;
  final dynamic deletedAt;
  final dynamic deletedBy;
  final dynamic usrAddrReceiverName;
  final dynamic usrAddrReceiverPhone;
  final dynamic usrAddrPrimary;
  final dynamic usrAddrSubdistrictId;
  final dynamic usrAddrAddress;
  final dynamic usrAddrAddressLabel;
  final dynamic usrAddrPostalCode;

  @override
  List<Object?> get props => [userId, code, phone];
}

class UserDetailEntity extends Equatable {
  UserDetailEntity({
    required this.id,
    required this.fullname,
    required this.email,
    required this.role,
    required this.active,
    this.whId,
    this.deviceToken,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    this.deletedAt,
    this.deletedBy,
    required this.emailConfirmed,
    required this.warehouseId,
    required this.warehouseName,
  });

  final int id;
  final String fullname;
  final String email;
  final int role;
  final int active;
  final dynamic whId;
  final dynamic deviceToken;
  final DateTime createdAt;
  final int createdBy;
  final DateTime updatedAt;
  final int updatedBy;
  final dynamic deletedAt;
  final dynamic deletedBy;
  final String emailConfirmed;
  final int warehouseId;
  final String warehouseName;

  @override
  List<Object?> get props => [id, fullname, email];
}
