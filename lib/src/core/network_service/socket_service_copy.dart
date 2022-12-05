import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:zido/src/core/network_service/api_urls.dart';

class HydraSocketClient {
  static HydraSocketClient? _instance;

  IOWebSocketChannel? _client;
  bool _isConnected = false;
  final _heartbeatInterval = 10;
  final _reconnectIntervalMs = 5000;
  int _reconnectCount = 120;
  final _sendBuffer = Queue();
  Timer? heartBeatTimer, _reconnectTimer;

  static HydraSocketClient getInstance() {
    return _instance ?? HydraSocketClient();
  }

  connectToSocket() async {
    if (!_isConnected) {
      const endPoint = ApiUrls.socketUri;
      WebSocket.connect(endPoint).then((ws) {
        _client = IOWebSocketChannel(ws);
        if (_client != null) {
          _reconnectCount = 120;
          _reconnectTimer?.cancel();
          _client?.sink.add("Socket added");
          _listenToMessage();
          _isConnected = true;
          _startHeartBeatTimer();
          while (_sendBuffer.isNotEmpty) {
            String text = _sendBuffer.first;
            _sendBuffer.remove(text);
            _push(text);
          }
        }
      }).onError((error, stackTrace) {
        disconnect();
        _reconnect();
      });
    }
  }

  _reconnect() async {
    if ((_reconnectTimer == null || !_reconnectTimer!.isActive) &&
        _reconnectCount > 0) {
      _reconnectTimer = Timer.periodic(Duration(seconds: _reconnectIntervalMs),
          (Timer timer) async {
        if (_reconnectCount == 0) {
          _reconnectTimer?.cancel();
          return;
        }
        await connectToSocket();
        _reconnectCount--;
      });
    }
  }

  _listenToMessage() {
    _client?.stream.listen(
      (message) {
        //parse message here
      },
      onDone: () {
        disconnect();
        _reconnect();
      },
    );
  }

  // bool subscribe(String text, {bool unsubscribeAllSubscribed = false}) {
  //   _push(text);
  // }

  _startHeartBeatTimer() {
    heartBeatTimer =
        Timer.periodic(Duration(seconds: _heartbeatInterval), (Timer timer) {
      // _client?.sink.add(_heartbeatData);
    });
  }

  void _push(String text) {
    if (_isConnected) {
      _client?.sink.add(text);
    } else {
      _sendBuffer.add(text);
    }
  }

  disconnect() {
    _client?.sink.close(status.goingAway);
    heartBeatTimer?.cancel();
    _reconnectTimer?.cancel();
    _isConnected = false;
  }

  int _fromBytesToInt32(List<int> elements) {
    ByteBuffer buffer = new Int8List.fromList(elements).buffer;
    ByteData byteData = new ByteData.view(buffer);
    return byteData.getInt32(0);
  }

  int _fromBytesToInt64(List<int> elements) {
    ByteBuffer buffer = new Int8List.fromList(elements).buffer;
    ByteData byteData = new ByteData.view(buffer);
    return byteData.getInt64(0);
  }
}
