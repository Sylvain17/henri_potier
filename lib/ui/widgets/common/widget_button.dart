import 'package:flutter/material.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/utils/app_theme.dart';

class WidgetButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const WidgetButton(this.text, {this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: AppTheme.margin16,
        right: AppTheme.margin16,
        bottom: AppTheme.margin16,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 48,
          decoration: const BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Center(
            child: WidgetText(
              text,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
