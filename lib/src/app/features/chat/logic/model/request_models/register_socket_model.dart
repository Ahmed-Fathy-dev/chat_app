import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_socket_model.g.dart';

@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
)
class RegisterSocket {
  const RegisterSocket({
    required this.event,
    required this.data,
  });

  final String event;
  final Data data;

  Map<String, dynamic> toJson() => _$RegisterSocketToJson(this);
}

@JsonSerializable(createFactory: false)
class Data {
  const Data(this.userId);

  final int userId;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
