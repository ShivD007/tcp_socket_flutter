import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifi_socket/modules/tcp_connect/view_models/tcp_connect_view_model.dart';

class TCPConnect extends GetView<TCPConnectViewModel> {
  const TCPConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wifi Lock"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                controller: controller.hostEditingController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  helperText: 'The ip address or hostname of the TCP server',
                  hintText: 'Enter the address here, e. g. 10.0.2.2',
                ),
              ),
              TextFormField(
                controller: controller.portEditingController,
                autovalidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  helperText: 'The port the TCP server is listening on',
                  hintText: 'Enter the port here, e. g. 8000',
                ),
              ),
              ElevatedButton(
                child: const Text('Connect'),
                onPressed: () {
                  controller.startConnect();
                },
              ),
              SizedBox(
                height: 100,
              ),
              controller.state.value == MyConnectionState.connected
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            controller.message,
                          ),
                          const Spacer(),
                          ElevatedButton(
                            child: const Text('send Message'),
                            onPressed: () {
                              controller.socket?.writeln("Unlock");
                            },
                          ),
                          ElevatedButton(
                            child: const Text('Disconnect'),
                            onPressed: () async {
                              controller.state.value = MyConnectionState.disconnecting;
                              controller.socketConnectionTask?.cancel();
                              await controller.socketStreamSub?.cancel();
                              await controller.socket?.close();
                              controller.state.value = MyConnectionState.idle;
                            },
                          )
                        ],
                      ),
                    )
                  : controller.state.value == MyConnectionState.connecting ||
                          controller.state.value == MyConnectionState.disconnecting
                      ? const Center(child: CircularProgressIndicator())
                      : controller.state.value == MyConnectionState.idle
                          ? const SizedBox()
                          : const Center(child: Text("failed")),
            ],
          ),
        ),
      ),
    );
  }
}
