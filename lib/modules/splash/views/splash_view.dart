import 'package:flutter/material.dart';

import '../../../routes/app_pages.dart';
import '../../../routes/custom_navigator.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    intialCall();
    super.initState();
  }

  Future<void> intialCall() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) async {
      CustomNavigator.pushReplacement(Routes.tcpConnect);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.blueGrey,
    ));
  }
}
