// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatsModelResponse _$ChatsModelResponseFromJson(Map<String, dynamic> json) =>
    ChatsModelResponse(
      status: json['status'] as int,
      message: json['message'] as String,
      chats: json['chats'] == null
          ? null
          : ChatsModel.fromJson(json['chats'] as Map<String, dynamic>),
    );

ChatsModel _$ChatsModelFromJson(Map<String, dynamic> json) => ChatsModel(
      currentPage: json['current_page'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserChat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

UserChat _$UserChatFromJson(Map<String, dynamic> json) => UserChat(
      id: json['id'] as int,
      senderId: json['sender_id'] as int,
      receiverId: json['receiver_id'] as int,
      receiverUsername: json['receiver_username'] as String?,
      receiverName: json['receiver_name'] as String?,
      receiverImg: json['receiver_img'] as String?,
      receiverVerifiedStatus: json['receiver_verified_status'] as int?,
      unreadMsg: json['unread_msg'] as int?,
      msgId: json['msg_id'] as int?,
      msgSenderId: json['msg_sender_id'] as int?,
      msgTxt: json['msg_txt'] as String?,
      msgState: json['msg_state'] as int?,
    );
