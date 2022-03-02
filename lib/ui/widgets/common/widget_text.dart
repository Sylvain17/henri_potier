import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle? style;
  final TextAlign? textAlign;

  const WidgetText(
    this.text, {
    this.color = Colors.black,
    this.style,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ?? TextStyle(color: color),
    );
  }
}
