import 'package:get/get.dart';

import '../view_models/tcp_connect_view_model.dart';

class TCPConnectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TCPConnectViewModel>(
      () => TCPConnectViewModel(),
    );
  }
}
