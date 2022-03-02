import 'package:flutter/material.dart';
import 'package:henri_potier/utils/app_theme.dart';
import 'package:henri_potier/utils/log.dart';

class WidgetTextField extends StatefulWidget {
  final bool isFocused;
  final String? hintText;
  final String? initialValue;
  final double? fontSize;
  final void Function(String)? onTextChanged;

  const WidgetTextField({
    this.isFocused = false,
    this.hintText,
    this.initialValue,
    this.fontSize,
    this.onTextChanged,
    Key? key,
  }) : super(key: key);

  @override
  WidgetTextFieldState createState() => WidgetTextFieldState();
}

@visibleForTesting
class WidgetTextFieldState extends State<WidgetTextField> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    if (widget.isFocused) {
      focusNode.requestFocus();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.colorPrimary,
      padding: EdgeInsets.all(AppTheme.margin16),
      child: Container(
        padding: EdgeInsets.only(
          left: AppTheme.margin16,
          right: AppTheme.margin16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.borderRadius),
          color: AppTheme.colorPrimary.shade100,
        ),
        child: TextFormField(
          focusNode: focusNode,
          initialValue: widget.initialValue,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          onChanged: (newText) => onTextChanged(newText),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
          ),
          style: TextStyle(fontSize: widget.fontSize),
        ),
      ),
    );
  }

  // region Methods

  void onTextChanged(String newText) {
    log("new text is $newText");
    if (widget.onTextChanged != null) {
      widget.onTextChanged!(newText);
    }
  }

// endregion
}
