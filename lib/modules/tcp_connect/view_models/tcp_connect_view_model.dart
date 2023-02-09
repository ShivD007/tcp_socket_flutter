import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum MyConnectionState { connecting, disconnecting, connected, failed, idle }

class TCPConnectViewModel extends GetxController {
  late TextEditingController? hostEditingController;
  late TextEditingController? portEditingController;
  late TextEditingController? chatTextEditingController;

  Socket? socket;
  StreamSubscription? socketStreamSub;
  ConnectionTask<Socket>? socketConnectionTask;

  Rx<MyConnectionState> state = Rx<MyConnectionState>(MyConnectionState.idle);

  String message = "";

  @override
  void onInit() {
    hostEditingController = TextEditingController(text: '10.0.2.2');
    portEditingController = TextEditingController(text: '8000');
    chatTextEditingController = TextEditingController(text: '');
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  startConnect() async {
    try {
      state.value = MyConnectionState.connecting;
      socketConnectionTask =
          await Socket.startConnect(hostEditingController?.text.toString(), int.parse(portEditingController!.text));
      socket = await socketConnectionTask!.socket.timeout(const Duration(seconds: 10));

      socketStreamSub = socket!.asBroadcastStream().listen((event) {
        message = String.fromCharCodes(event);
      });

      state.value = MyConnectionState.connected;
    } catch (err) {
      state.value = MyConnectionState.failed;
    }
  }
}
