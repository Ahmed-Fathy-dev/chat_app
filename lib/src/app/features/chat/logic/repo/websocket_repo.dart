// import 'dart:async';

// import 'package:dartz/dartz.dart';
// import 'package:zido/src/core/network_service/socket_service.dart';

// import '../../../../../core/utils/logger_util.dart';
// import '../model/request_models/register_socket_model.dart';
// import '../model/response_models/messages_model_response.dart';

// abstract class WebsocketRepo {
//   void registerSocketRepo(
//     RegisterSocket registerRepo,
//   );
//   void responseRepo();
// }

// class WebsocketRepoImpl extends WebsocketRepo {
//   WebsocketRepoImpl(this._socket);
//   final SocketService _socket;
//   final StreamController str = StreamController.broadcast();

//   @override
//   void registerSocketRepo(
//     RegisterSocket registerRepo,
//   ) async {
//     try {
//       final currentState = await _socket.connectStatus();
//       final channel = _socket.sucscribeChannel();
//       if (!currentState) {
//         logger.wtf(currentState);
//       }
//       channel.sink.add(registerRepo.toJson());

//       logger.wtf(currentState);
//     } catch (e) {
//       logger.wtf(e.toString());
//       rethrow;
//     } finally {
//       _socket.disconnect();
//     }
//   }

//   @override
//   void responseRepo() async {
//     try {
//       final status = await _socket.connectStatus();
//       final channel = _socket.sucscribeChannel();
//       if (status) {
//         str.addStream(channel.stream);
//         str.stream.listen((event) {
//           logger.wtf(event.toString());
//         }, onDone: () {
//           _socket.disconnect();
//           str.close();
//         }, cancelOnError: true);
//       }
//     } catch (e) {
//       logger.e(e.toString());
//       rethrow;
//     }
//   }
// }
