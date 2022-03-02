import 'package:flutter/material.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/ui/widgets/business/widget_price.dart';
import 'package:henri_potier/ui/widgets/common/widget_button.dart';
import 'package:henri_potier/ui/widgets/common/widget_space.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/utils/app_theme.dart';

class WidgetBookDetails extends StatelessWidget {
  final Book book;
  final VoidCallback? onPressed;

  const WidgetBookDetails(this.book, {this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.margin16),
      child: Column(
        children: [
          Image.network(
            book.cover,
            fit: BoxFit.cover,
          ),
          WidgetSpace(),
          WidgetText(
            book.title,
            style: AppTheme.styleTitle,
          ),
          WidgetSpace(),
          WidgetText(
            book.getSynopsisString(),
            style: AppTheme.styleSynopsis,
            textAlign: TextAlign.justify,
          ),
          WidgetSpace(),
          WidgetPrice(book.price),
          WidgetSpace(),
          WidgetButton(
            'Ajouter au panier',
            showMargins: false,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
