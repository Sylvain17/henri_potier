import 'package:flutter/material.dart';
import 'package:henri_potier/utils/app_theme.dart';

class WidgetSpace extends StatelessWidget {
  final double size;

  const WidgetSpace([this.size = AppTheme.margin16]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size, width: size);
  }
}
