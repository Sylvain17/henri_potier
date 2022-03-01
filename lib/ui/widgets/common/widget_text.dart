import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  final String text;
  final Color color;

  const WidgetText(this.text, {this.color = Colors.black, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color),
    );
  }
}
