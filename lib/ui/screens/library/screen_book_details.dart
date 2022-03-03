import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/screens/basket/controller/controller_basket.dart';
import 'package:henri_potier/ui/screens/library/controller/controller_library.dart';
import 'package:henri_potier/ui/widgets/business/widget_book_details.dart';
import 'package:henri_potier/ui/widgets/common/widget_screen.dart';

class ScreenBookDetails extends GetView<ControllerLibrary> {
  final controllerBasket = Get.find<ControllerBasket>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WidgetScreen(
        title: 'Détails',
        children: [
          Expanded(
            child: WidgetBookDetails(
              controller.selectedBook.value,
              buttonText: controllerBasket.isBookInBasket(controller.selectedBook.value) ? "Retirer du panier" : "Ajouter au panier",
              onPressed: () => controllerBasket.isBookInBasket(controller.selectedBook.value)
                  ? controllerBasket.removeBookFromBasket(controller.selectedBook.value)
                  : controllerBasket.addBookToBasket(controller.selectedBook.value),
            ),
          ),
        ],
      ),
    );
  }
}
