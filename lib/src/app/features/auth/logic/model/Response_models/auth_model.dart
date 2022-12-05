import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_model.g.dart';

@JsonSerializable(createToJson: false)
class AuthModelResponse extends Equatable {
  const AuthModelResponse({
    required this.status,
    required this.message,
    this.data,
  });

  final int status;
  final String message;
  final AuthModel? data;

  factory AuthModelResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthModelResponseFromJson(json);

  @override
  List<Object?> get props => [
        status,
        message,
        data,
      ];
}

@JsonSerializable(createToJson: false)
class AuthModel extends Equatable {
  const AuthModel({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.phoneNumber,
    //  required this.countryCode,
    //  required this.phoneCode,
    required this.image,
    required this.cover,
    required this.bio,
    required this.gender,
    required this.authLevel,
    required this.authId,
    required this.deviceType,
    required this.deviceToken,
    required this.lang,
    required this.type,
    required this.chatEnabled,
    required this.token,
  });

  final int id;
  final String username;
  final String name;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  // @JsonKey(name: '____')
  // final String countryCode;
  // @JsonKey(name: '____')
  // final String phoneCode;
  // @JsonKey(name: '____')
  // final String otpId;
  // final String otp;
  // @JsonKey(name: '____')
  // final int otpVerifFlag;
  // @JsonKey(name: '____')
  // final int otpCount;
  // @JsonKey(name: '____')
  // final int notificationFlag;
  // @JsonKey(name: '____')
  final String image;
  final dynamic cover;
  final String bio;
  final int gender;
  // @JsonKey(name: '____')
  // final int countryId;
  // final String address;
  @JsonKey(name: 'auth_level')
  final int authLevel;
  @JsonKey(name: 'auth_id')
  final String authId;
  @JsonKey(name: 'device_type')
  final String deviceType;
  @JsonKey(name: 'device_token')
  final String deviceToken;
  // final String role;
  // @JsonKey(name: '____')
  // final int packageSelected;
  // @JsonKey(name: '____')
  // final int userRating;
  // @JsonKey(name: '____')
  // final int totalRating;
  // @JsonKey(name: '____')
  // final int totalRatingCount;
  // final int banned;
  // @JsonKey(name: '____')
  // final int approvalStatus;
  final String lang;
  // @JsonKey(name: '____')
  // final int freeAccessFlag;
  // @JsonKey(name: '____')
  // final dynamic passwdRecoveryCode;
  // @JsonKey(name: '____')
  // final dynamic passwdRecoveryDate;
  // @JsonKey(name: '____')
  // final dynamic passwdModifiedAt;
  // @JsonKey(name: '____')
  // final dynamic lastLogin;
  // @JsonKey(name: '____')
  // final int isProfileCompleted;
  // @JsonKey(name: '____')
  // final int registerThrough;
  // @JsonKey(name: '____')
  // final String createdAt;
  // @JsonKey(name: '____')
  // final String modifiedAt;
  // @JsonKey(name: '____')
  // final int comission;
  final int type;
  // @JsonKey(name: '____')
  // final String companyName;
  // @JsonKey(name: '____')
  // final DateTime updatedAt;
  // @JsonKey(name: '____')
  // final dynamic hearAboutZido;
  // @JsonKey(name: '____')
  // final dynamic marketerId;
  // final int credit;
  // final int debit;
  @JsonKey(name: 'chat_enabled')
  final int chatEnabled;
  // @JsonKey(name: '____')
  // final int verifiedStatus;
  // @JsonKey(name: '____')
  // final int referralImpressions;
  // @JsonKey(name: '____')
  // final dynamic deletedAt;
  // @JsonKey(name: '____')
  // final dynamic imageThumbnail;
  // @JsonKey(name: '____')
  // final int migratedToCdn;
  final String token;
  // @JsonKey(name: '____')
  // final int paymentStatus;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  @override
  List<Object?> get props => [
        id,
        username,
        name,
        email,
        phoneNumber,
        image,
        cover,
        bio,
        gender,
        authLevel,
        authId,
        deviceType,
        deviceToken,
        lang,
        type,
        chatEnabled,
        token,
      ];
}


// class Country {
//   Country({
//     this.id,
//     this.sortname,
//     this.name,
//     this.nameAr,
//     this.phonecode,
//     this.priority,
//     this.countryFlag,
//     this.createdAt,
//     this.updatedAt,
//   });

//   final int id;
//   final String sortname;
//   final String name;
//   final dynamic nameAr;
//   final int phonecode;
//   final int priority;
//   final String countryFlag;
//   final DateTime createdAt;
//   final DateTime updatedAt;
// }
