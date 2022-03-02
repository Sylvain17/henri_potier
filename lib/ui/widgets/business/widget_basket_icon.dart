import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/controllers/controller_main.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/utils/app_routes.dart';
import 'package:henri_potier/utils/app_theme.dart';

class WidgetBasketIcon extends StatelessWidget {
  final controllerMain = Get.find<ControllerMain>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () {
          if (Get.currentRoute != AppRoutes.screenBasket) {
            Get.toNamed(AppRoutes.screenBasket);
          }
        },
        child: Row(
          children: [
            controllerMain.booksInBasket.isEmpty ? Container() : WidgetText(controllerMain.booksInBasket.length.toString(), color: Colors.white),
            Container(
              color: AppTheme.colorPrimary,
              width: 24,
              height: 24,
              child: Image.asset("assets/images/basket.png"),
            ),
          ],
        ),
      ),
    );
  }
}
