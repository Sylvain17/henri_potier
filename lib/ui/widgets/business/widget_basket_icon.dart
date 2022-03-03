import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/screens/basket/controller/controller_basket.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/utils/app_routes.dart';
import 'package:henri_potier/utils/app_theme.dart';

class WidgetBasketIcon extends StatelessWidget {
  final controllerBasket = Get.find<ControllerBasket>();

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
            controllerBasket.booksInBasket.isEmpty ? Container() : WidgetText(controllerBasket.booksInBasket.length.toString(), color: Colors.white),
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
