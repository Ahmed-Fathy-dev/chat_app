import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:zido/src/core/network_service/network_service.dart';

import '../../../../../core/network_service/api_urls.dart';
import '../../../../../core/network_service/exception_dio_message.dart';
import '../model/request_models/messages_model_request.dart';
import '../model/response_models/chats_model_response.dart';
import '../model/response_models/messages_model_response.dart';

abstract class ChatServiceRepo {
  Future<Either<Failure, ChatsModelResponse>> getUserChatsRepo(int page);
  Future<Either<Failure, MessagesModelResponse>> getUserMessagesRepo(
      MessagesModelRequest messagesMRq);
}

class ChatServiceRepoImpl extends ChatServiceRepo {
  ChatServiceRepoImpl(this._netService);
  final NetworkService _netService;

  @override
  Future<Either<Failure, ChatsModelResponse>> getUserChatsRepo(int page) async {
    try {
      final response = await _netService.get(
        ApiUrls.userChats,
        isAuth: true,
        queryParameters: {
          'page': page,
        },
      );
      return Right(ChatsModelResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Left(Failure.fromCode(e));
    }
  }

  @override
  Future<Either<Failure, MessagesModelResponse>> getUserMessagesRepo(
      MessagesModelRequest messagesMRq) async {
    try {
      final response = await _netService.get(
        ApiUrls.messages,
        isAuth: true,
        queryParameters: messagesMRq.toJson(),
      );
      return Right(MessagesModelResponse.fromJson(response.data));
    } on DioError catch (e) {
      return Left(Failure.fromCode(e));
    }
  }
}
