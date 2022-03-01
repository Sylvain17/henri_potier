import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/controllers/controller_main.dart';
import 'package:henri_potier/ui/screens/splash/controller/controller_splash.dart';
import 'package:henri_potier/ui/widgets/common/widget_screen.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';

class ScreenSplash extends StatelessWidget {
  final controller = Get.put(ControllerSplash());
  final controllerMain = Get.put(ControllerMain(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return const WidgetScreen(
      title: 'Splash',
      canGoBack: false,
      children: [
        WidgetText('Splash'),
      ],
    );
  }
}
