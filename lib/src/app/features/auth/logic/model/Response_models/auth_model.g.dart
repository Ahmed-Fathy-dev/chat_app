// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthModelResponse _$AuthModelResponseFromJson(Map<String, dynamic> json) =>
    AuthModelResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : AuthModel.fromJson(json['data'] as Map<String, dynamic>),
    );

AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => AuthModel(
      id: json['id'] as int,
      username: json['username'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      image: json['image'] as String,
      cover: json['cover'],
      bio: json['bio'] as String,
      gender: json['gender'] as int,
      authLevel: json['auth_level'] as int,
      authId: json['auth_id'] as String,
      deviceType: json['device_type'] as String,
      deviceToken: json['device_token'] as String,
      lang: json['lang'] as String,
      type: json['type'] as int,
      chatEnabled: json['chat_enabled'] as int,
      token: json['token'] as String,
    );
