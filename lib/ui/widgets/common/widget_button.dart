import 'package:flutter/material.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/utils/app_theme.dart';

class WidgetButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool showMargins;
  final bool showInversedColors;

  const WidgetButton(
    this.text, {
    this.onPressed,
    this.showMargins = true,
    this.showInversedColors = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: showMargins
          ? const EdgeInsets.only(
              left: AppTheme.margin16,
              right: AppTheme.margin16,
              bottom: AppTheme.margin16,
            )
          : null,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: showInversedColors ? Colors.white : AppTheme.colorPrimary,
            borderRadius: BorderRadius.all(
              Radius.circular(AppTheme.borderRadius),
            ),
          ),
          child: Center(
            child: WidgetText(
              text,
              color: showInversedColors ? AppTheme.colorPrimary : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
