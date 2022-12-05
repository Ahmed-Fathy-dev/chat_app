// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagesModelResponse _$MessagesModelResponseFromJson(
        Map<String, dynamic> json) =>
    MessagesModelResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      chat: json['chat'] == null
          ? null
          : ChatM.fromJson(json['chat'] as Map<String, dynamic>),
      messages: json['messages'] == null
          ? null
          : MessagesModel.fromJson(json['messages'] as Map<String, dynamic>),
    );

ChatM _$ChatMFromJson(Map<String, dynamic> json) => ChatM(
      roomId: json['room_id'],
      chatId: json['chat_id'] as int?,
      receiverId: json['receiver_id'] as String?,
      receiverName: json['receiver_name'] as String?,
      receiverImg: json['receiver_img'] as String?,
      recieverVerifiedStatus: json['reciever_verified_status'] as int?,
    );

MessagesModel _$MessagesModelFromJson(Map<String, dynamic> json) =>
    MessagesModel(
      currentPage: json['current_page'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserMessages.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

UserMessages _$UserMessagesFromJson(Map<String, dynamic> json) => UserMessages(
      id: json['id'] as int?,
      chatId: json['chat_id'] as int?,
      roomId: json['room_id'],
      userId: json['user_id'] as int,
      txt: json['txt'] as String,
      state: json['state'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String,
      recieverVerifiedStatus: json['reciever_verified_status'] as int?,
    );

MessageModelRes _$MessageModelResFromJson(Map<String, dynamic> json) =>
    MessageModelRes(
      event: json['event'] as String,
      data: json['data'] == null
          ? null
          : MessageModel.fromJson(json['data'] as Map<String, dynamic>),
    );

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int,
      to: json['to'] as int,
      content: json['content'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'to': instance.to,
      'content': instance.content,
      'image': instance.image,
    };

RegisteryModel _$RegisteryModelFromJson(Map<String, dynamic> json) =>
    RegisteryModel(
      event: json['event'] as String,
      message: json['message'] as String?,
    );
