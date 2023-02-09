import 'package:get/get_navigation/src/routes/get_route.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/tcp_connect/bindings/tcp_connect_binding.dart';
import '../modules/tcp_connect/views/tcp_connect_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.tcpConnect,
      page: () => const TCPConnect(),
      binding: TCPConnectBinding(),
    ),
  ];
}
