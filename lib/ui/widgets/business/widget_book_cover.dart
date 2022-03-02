import 'package:flutter/material.dart';
import 'package:henri_potier/models/book.dart';

class WidgetBookCover extends StatelessWidget {
  final Book book;
  const WidgetBookCover(this.book, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(book.cover, fit: BoxFit.cover),
      ],
    );
  }
}
