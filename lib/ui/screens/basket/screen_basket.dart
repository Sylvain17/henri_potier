import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/screens/basket/controller/controller_basket.dart';
import 'package:henri_potier/ui/widgets/business/widget_book_basket.dart';
import 'package:henri_potier/ui/widgets/business/widget_price.dart';
import 'package:henri_potier/ui/widgets/common/widget_button.dart';
import 'package:henri_potier/ui/widgets/common/widget_screen.dart';
import 'package:henri_potier/ui/widgets/common/widget_space.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/utils/app_theme.dart';

class ScreenBasket extends GetView<ControllerBasket> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WidgetScreen(
        title: 'Panier',
        children: [
          controller.booksInBasket.isEmpty
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
                            children: controller.booksInBasket
                                .map(
                                  (book) => WidgetBookBasket(
                                    book,
                                    onPressed: () => controller.removeBookFromBasket(book),
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
                        child: controller.hasCommercialOffersException.isTrue
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: AppTheme.margin16, right: AppTheme.margin16),
                                  child: WidgetButton(
                                    "Erreur de connexion : Réessayer",
                                    onPressed: controller.retrieveCommercialOffers,
                                    showInversedColors: true,
                                    showMargins: false,
                                  ),
                                ),
                              )
                            : controller.areCommercialOffersLoaded.isFalse
                                ? const SpinKitThreeBounce(
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          WidgetText("avant réduction", color: Colors.white),
                                          WidgetSpace(),
                                          WidgetPrice(
                                            controller.commercialOffers.value.getBooksPrice(),
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
                                            controller.commercialOffers.value.getFinalPrice(),
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
