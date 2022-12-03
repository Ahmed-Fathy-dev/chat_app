import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'messages_model_response.g.dart';

@JsonSerializable(createToJson: false)
class MessagesModelResponse extends Equatable {
  const MessagesModelResponse({
    required this.status,
    required this.message,
    this.chat,
    this.messages,
  });

  final int status;
  final String message;
  final ChatM? chat;
  final MessagesModel? messages;

  factory MessagesModelResponse.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelResponseFromJson(json);

  @override
  List<Object?> get props => [
        status,
        message,
        chat,
        messages,
      ];
}

@JsonSerializable(createToJson: false)
class ChatM extends Equatable {
  const ChatM({
    this.roomId,
    this.chatId,
    this.receiverId,
    this.receiverName,
    this.receiverImg,
    this.recieverVerifiedStatus,
  });
  @JsonKey(name: 'room_id')
  final dynamic roomId;
  @JsonKey(name: 'chat_id')
  final int? chatId;
  @JsonKey(name: 'receiver_id')
  final String? receiverId;
  @JsonKey(name: 'receiver_name')
  final String? receiverName;
  @JsonKey(name: 'receiver_img')
  final String? receiverImg;
  @JsonKey(name: 'reciever_verified_status')
  final int? recieverVerifiedStatus;

  factory ChatM.fromJson(Map<String, dynamic> json) =>
      _$ChatMFromJson(json);

  @override
  List<Object?> get props => [
        roomId,
        chatId,
        receiverId,
        receiverName,
        receiverImg,
        recieverVerifiedStatus,
      ];
}

@JsonSerializable(createToJson: false)
class MessagesModel extends Equatable {
  const MessagesModel({
    required this.currentPage,
    required this.data,
    // this.firstPageUrl,
    // this.from,
    // this.lastPage,
    // this.lastPageUrl,
    // this.nextPageUrl,
    // this.path,
    // this.perPage,
    // this.prevPageUrl,
    // this.to,
    // this.total,
  });

  @JsonKey(name: 'current_page')
  final int currentPage;
  final List<UserMessages> data;

  factory MessagesModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesModelFromJson(json);

  @override
  List<Object> get props => [
        currentPage,
        data,
      ];
  // final String firstPageUrl;
  // final int from;
  // final int lastPage;
  // final String lastPageUrl;
  // final String nextPageUrl;
  // final String path;
  // final int perPage;
  // final dynamic prevPageUrl;
  // final int to;
  // final int total;
}

@JsonSerializable(createToJson: false)
class UserMessages extends Equatable {
  const UserMessages({
    required this.id,
    required this.chatId,
    required this.roomId,
    required this.userId,
    required this.txt,
    required this.state,
    // this.createdAt,
    // this.updatedAt,
    required this.name,
    required this.image,
    required this.recieverVerifiedStatus,
  });

  final int id;
  @JsonKey(name: 'chat_id')
  final int chatId;
  @JsonKey(name: 'room_id')
  final dynamic roomId;
  @JsonKey(name: 'user_id')
  final int userId;
  final String txt;
  final int state;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  final String name;
  final String image;
  @JsonKey(name: 'reciever_verified_status')
  final int recieverVerifiedStatus;

  factory UserMessages.fromJson(Map<String, dynamic> json) =>
      _$UserMessagesFromJson(json);

  @override
  List<Object?> get props => [
        id,
        chatId,
        roomId,
        userId,
        txt,
        state,
        name,
        image,
        recieverVerifiedStatus,
      ];
}
