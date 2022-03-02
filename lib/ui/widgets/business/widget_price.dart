import 'package:flutter/material.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/utils/app_theme.dart';

class WidgetPrice extends StatelessWidget {
  final int price;

  const WidgetPrice(this.price, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WidgetText(
      "$price€",
      style: AppTheme.stylePrice,
    );
  }
}
