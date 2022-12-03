import 'package:json_annotation/json_annotation.dart';

part 'login_model_request.g.dart';

@JsonSerializable(createFactory: false)
class LoginModelRequest {
  final String lang;
  final String password;
  @JsonKey(name: 'device_type')
  final String deviceType;
  final String email;
  @JsonKey(name: 'device_token')
  final String deviceToken;

  LoginModelRequest({
    this.lang = 'en',
    this.password = '123456',
    this.deviceType = 'Android',
    this.email = 'nahed2',
    this.deviceToken =
        '0Ea12Ed5B4A5Bab71C864281459Ee678Eaacc2306F09521E5642C17C6985D4E9',
  });

  Map<String, dynamic> toJson() => _$LoginModelRequestToJson(this);
}
