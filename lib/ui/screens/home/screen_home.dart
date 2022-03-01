import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/screens/home/controller/controller_home.dart';
import 'package:henri_potier/ui/widgets/common/widget_button.dart';
import 'package:henri_potier/ui/widgets/common/widget_screen.dart';

class ScreenHome extends StatelessWidget {
  final controller = Get.put(ControllerHome());

  @override
  Widget build(BuildContext context) {
    return WidgetScreen(
      title: 'Home',
      children: [
        WidgetButton(
          'Go Basket',
          onPressed: controller.gotoScreenBasket,
        ),
      ],
    );
  }
}
