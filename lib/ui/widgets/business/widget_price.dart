import 'package:flutter/material.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/utils/app_theme.dart';

class WidgetPrice extends StatelessWidget {
  final int price;
  final Color color;
  final double? fontSize;

  const WidgetPrice(
    this.price, {
    this.color = AppTheme.colorPrimary,
    this.fontSize = 30,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetText(
      "$price€",
      style: AppTheme.stylePrice.copyWith(color: color, fontSize: fontSize),
    );
  }
}
