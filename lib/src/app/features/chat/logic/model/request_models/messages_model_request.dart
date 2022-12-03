import 'package:json_annotation/json_annotation.dart';

part 'messages_model_request.g.dart';

@JsonSerializable(createFactory: false)
class MessagesModelRequest {
  @JsonKey(name: 'receiver_id')
  final int receiverId;
  final int page;
  final String lang;

  const MessagesModelRequest({
    required this.receiverId,
    required this.page,
    required this.lang,
  });

  Map<String, dynamic> toJson() => _$MessagesModelRequestToJson(this);
}
