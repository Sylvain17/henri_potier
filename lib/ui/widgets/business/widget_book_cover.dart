import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/ui/controllers/controller_main.dart';
import 'package:henri_potier/utils/app_theme.dart';

class WidgetBookCover extends StatelessWidget {
  final controllerMain = Get.find<ControllerMain>();

  final Book book;

  WidgetBookCover(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(book.cover, fit: BoxFit.cover),
        Positioned(
          bottom: 8,
          right: 8,
          child: Obx(
            () => controllerMain.isBookInBasket(book)
                ? Container(
                    decoration: BoxDecoration(color: AppTheme.colorPrimary, shape: BoxShape.circle),
                    padding: EdgeInsets.all(12),
                    child: SizedBox(
                      width: 16,
                      height: 16,
                      child: Image.asset("assets/images/basket.png"),
                    ),
                  )
                : Container(),
          ),
        )
      ],
    );
  }
}
