import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/controllers/controller_main.dart';
import 'package:henri_potier/ui/widgets/common/widget_button.dart';
import 'package:henri_potier/ui/widgets/common/widget_screen.dart';

class ScreenBasket extends GetView<ControllerMain> {
  @override
  Widget build(BuildContext context) {
    return WidgetScreen(
      title: 'Basket',
      children: [
        WidgetButton(
          'Go Back',
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}
