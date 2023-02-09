import 'dart:async';
import 'dart:io';

class TCPConnectManager {
  static Socket? _socket;
  static StreamSubscription? _socketStreamSub;
  static ConnectionTask<Socket>? _socketConnectionTask;

  startConnect() async {
    _socketConnectionTask = await Socket.startConnect("", 87878);
    _socket = await _socketConnectionTask!.socket;
  }
}
