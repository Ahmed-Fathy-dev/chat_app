import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chats_model_response.g.dart';

@JsonSerializable(createToJson: false)
class ChatsModelResponse extends Equatable {
  const ChatsModelResponse({
    required this.status,
    required this.message,
    this.chats,
  });

  final int status;
  final String message;
  final ChatsModel? chats;

  factory ChatsModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatsModelResponseFromJson(json);

  @override
  List<Object?> get props => [
        status,
        message,
        chats,
      ];
}

@JsonSerializable(createToJson: false)
class ChatsModel extends Equatable {
  const ChatsModel({
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
  final List<UserChat> data;
  // final String firstPageUrl;
  // final int from;
  // final int lastPage;
  // final String lastPageUrl;
  // final dynamic nextPageUrl;
  // final String path;
  // final int perPage;
  // final dynamic prevPageUrl;
  // final int to;
  // final int total;

  factory ChatsModel.fromJson(Map<String, dynamic> json) =>
      _$ChatsModelFromJson(json);

  @override
  List<Object?> get props => [
        currentPage,
        data,
        // firstPageUrl,
        // from,
        // lastPage,
        // lastPageUrl,
        // nextPageUrl,
        // path,
        // perPage,
        // prevPageUrl,
        // to,
        // total,
      ];
}

@JsonSerializable(createToJson: false)
class UserChat extends Equatable {
  const UserChat({
    required this.id,
    required this.senderId,
    required this.receiverId,
    // this.createdAt,
    // this.updatedAt,
    this.receiverUsername,
    this.receiverName,
    this.receiverImg,
    this.receiverVerifiedStatus,
    this.unreadMsg,
    this.msgId,
    this.msgSenderId,
    this.msgTxt,
    this.msgState,
  });

  final int id;
  @JsonKey(name: 'sender_id')
  final int senderId;
  @JsonKey(name: 'receiver_id')
  final int receiverId;
  // final String createdAt;
  // final String updatedAt;
  @JsonKey(name: 'receiver_username')
  final String? receiverUsername;
  @JsonKey(name: 'receiver_name')
  final String? receiverName;
  @JsonKey(name: 'receiver_img')
  final String? receiverImg;
  @JsonKey(name: 'receiver_verified_status')
  final int? receiverVerifiedStatus;
  @JsonKey(name: 'unread_msg')
  final int? unreadMsg;
  @JsonKey(name: 'msg_id')
  final int? msgId;
  @JsonKey(name: 'msg_sender_id')
  final int? msgSenderId;
  @JsonKey(name: 'msg_txt')
  final String? msgTxt;
  @JsonKey(name: 'msg_state')
  final int? msgState;

  factory UserChat.fromJson(Map<String, dynamic> json) =>
      _$UserChatFromJson(json);

  @override
  List<Object?> get props => [
        id,
        senderId,
        receiverId,
        receiverUsername,
        receiverName,
        receiverImg,
        receiverVerifiedStatus,
        unreadMsg,
        msgId,
        msgSenderId,
        msgTxt,
        msgState,
      ];
}
