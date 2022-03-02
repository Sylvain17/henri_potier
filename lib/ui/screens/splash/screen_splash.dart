import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/controllers/controller_main.dart';
import 'package:henri_potier/ui/screens/splash/controller/controller_splash.dart';
import 'package:henri_potier/utils/app_theme.dart';

class ScreenSplash extends StatelessWidget {
  final controller = Get.put(ControllerSplash());
  final controllerMain = Get.put(ControllerMain(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colorPrimary,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo_big.png"),
          ],
        ),
      ),
    );
  }
}
