import 'package:flutter/material.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/ui/widgets/business/widget_price.dart';
import 'package:henri_potier/ui/widgets/common/widget_button.dart';
import 'package:henri_potier/ui/widgets/common/widget_space.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/utils/app_theme.dart';

class WidgetBookBasket extends StatelessWidget {
  final Book book;
  final VoidCallback? onPressed;

  const WidgetBookBasket(this.book, {this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                book.cover,
                fit: BoxFit.cover,
                height: 200,
              ),
              WidgetSpace(),
              Expanded(
                child: Column(
                  children: [
                    WidgetText(
                      book.title,
                      style: AppTheme.styleTitleInBasket,
                    ),
                    WidgetSpace(),
                    WidgetPrice(book.price),
                    WidgetSpace(),
                    WidgetButton(
                      'Retirer du panier',
                      showMargins: false,
                      onPressed: onPressed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
