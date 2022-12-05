// import 'package:web_socket_channel/status.dart' as status;

// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:zido/src/core/network_service/socket_service.dart';
// import 'package:zido/src/core/utils/logger_util.dart';

// import '../../model/request_models/register_socket_model.dart';

// part 'send_message_event.dart';
// part 'send_message_state.dart';

// class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
//   final SocketService _socket;
//   SendMessageBloc(this._socket) : super(const SendMessageState()) {
//     on<RegisterSocketEvent>(_onRegisterSocket);
//   }

//   void _onRegisterSocket(
//     RegisterSocketEvent event,
//     Emitter<SendMessageState> emit,
//   ) async {
//     final channel = _socket.sucscribeChannel();
//     channel.sink.add(
//       '{"event": "messageTo","data": {"user_id": 2050,"to":1768, "content": "Hello from client id 2050","image": ""}}',
//     );
//     // c.sink.add(
//     //   '{"event": "register","data": {"user_id": 1768}}',
//     // );
//     channel.stream.listen((event) {
//       logWtf('listen');
//       logger.wtf(event.toString());
//     }, onDone: () {
//       logWtf('done');
//     }, cancelOnError: true);
//   }

//   void onClose() {
//     _socket.disconnect();
//   }

//   @override
//   Future<void> close() async {
//     super.close();
//     return _socket.disconnect();
//   }
// }
