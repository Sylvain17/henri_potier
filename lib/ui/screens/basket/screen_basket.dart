import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/controllers/controller_main.dart';
import 'package:henri_potier/ui/widgets/business/widget_book_basket.dart';
import 'package:henri_potier/ui/widgets/business/widget_price.dart';
import 'package:henri_potier/ui/widgets/common/widget_screen.dart';
import 'package:henri_potier/ui/widgets/common/widget_space.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/utils/app_theme.dart';

class ScreenBasket extends GetView<ControllerMain> {
  final controllerMain = Get.find<ControllerMain>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WidgetScreen(
        title: 'Panier',
        children: [
          controllerMain.booksInBasket.isEmpty
              ? Expanded(
                  child: Center(
                    child: const WidgetText('Panier vide'),
                  ),
                )
              : Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(AppTheme.margin16),
                          child: StaggeredGrid.count(
                            crossAxisCount: 1,
                            mainAxisSpacing: AppTheme.margin16,
                            crossAxisSpacing: AppTheme.margin16,
                            children: controllerMain.booksInBasket
                                .map(
                                  (book) => WidgetBookBasket(
                                    book,
                                    onPressed: () => controllerMain.removeBookFromBasket(book),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: double.infinity,
                        color: AppTheme.colorPrimary,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetText("avant réduction", color: Colors.white),
                                WidgetSpace(),
                                WidgetPrice(
                                  controllerMain.commercialOffers.value.getBooksPrice(),
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetText("prix final", color: Colors.white),
                                WidgetSpace(),
                                WidgetPrice(
                                  controllerMain.commercialOffers.value.getFinalPrice(),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
