import 'package:core/core.dart';

class RegisterReqEntity extends Equatable {
  RegisterReqEntity({
    required this.avatar64,
    required this.idCard64,
    required this.name,
    required this.email,
    required this.phone,
    required this.sex,
    required this.dob,
    required this.address,
    required this.provinceId,
    required this.subdistrictId,
    required this.placeId,
  });
  String avatar64;
  String idCard64;
  String name;
  String email;
  String phone;
  String sex;
  String dob;
  String address;
  String provinceId;
  String placeId;
  String subdistrictId;

  @override
  List<Object?> get props => [avatar64, idCard64];
}

class RegisterRespEntity extends Equatable {
  RegisterRespEntity({
    required this.message,
    required this.data,
  });

  final String message;
  final List<RegisterRespDataEntity> data;

  @override
  List<Object?> get props => [message, data];
}

class RegisterRespDataEntity extends Equatable {
  RegisterRespDataEntity({
    required this.user,
    required this.profile,
  });

  final UserEntity user;
  final ProfileEntity profile;

  @override
  List<Object?> get props => [user, profile];
}

class ProfileEntity extends Equatable {
  ProfileEntity({
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
  List<Object?> get props => [postalCode, photoKtp];
}

class UserEntity extends Equatable {
  UserEntity({
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

  @override
  // TODO: implement props
  List<Object?> get props => [emailConfirmed, whId];
}
