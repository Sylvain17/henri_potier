import 'package:flutter/material.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';

class WidgetBook extends StatelessWidget {
  final Book book;
  const WidgetBook(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetText(book.title);
  }
}
