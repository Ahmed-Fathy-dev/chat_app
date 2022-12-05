import 'dart:async';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../utils/logger_util.dart';
import 'api_urls.dart';

// import 'package:web_socket_channel/status.dart' as status;

class SocketService {
  final IOWebSocketChannel _channel;

  const SocketService(this._channel);

  IOWebSocketChannel sucscribeChannel() {
    return _channel;
  }

  int? get getState {
    return _channel.innerWebSocket?.readyState;
  }

  Future<bool> connectStatus() async {
    IOWebSocketChannel.connect(Uri.parse(ApiUrls.socketUri));
    final currentState =
        await Future.delayed(const Duration(milliseconds: 1000), () {
      final state = _channel.innerWebSocket?.readyState;
      return state;
    });
    currentState?.logWtf('currentState');
    return currentState != null;
  }

  void disconnect() {
    _channel.sink.close(status.goingAway);
  }
}
