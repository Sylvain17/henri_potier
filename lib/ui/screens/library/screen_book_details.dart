import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/controllers/controller_main.dart';
import 'package:henri_potier/ui/screens/library/controller/controller_library.dart';
import 'package:henri_potier/ui/widgets/business/widget_book_details.dart';
import 'package:henri_potier/ui/widgets/common/widget_screen.dart';

class ScreenBookDetails extends StatelessWidget {
  final controller = Get.put(ControllerLibrary());
  final controllerMain = Get.find<ControllerMain>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WidgetScreen(
        title: 'Détails',
        children: [
          Expanded(
            child: WidgetBookDetails(
              controller.selectedBook.value,
              onPressed: () => controllerMain.addBookToBasket(controller.selectedBook.value),
            ),
          ),
        ],
      ),
    );
  }
}
