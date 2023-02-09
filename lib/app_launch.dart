import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifi_socket/routes/app_pages.dart';

import 'core/app_themes.dart';

class AppLaunch extends StatelessWidget {
  const AppLaunch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "",
          translationsKeys: {},
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          enableLog: true,
          themeMode: ThemeMode.system,
          theme: AppThemes.ligtTheme,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          builder: (context, child) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              child: child,
            );
          },
        );
      },
    );
  }
}
