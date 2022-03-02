import 'package:flutter/material.dart';

class AppTheme {
  static const double margin16 = 16.0;
  static const double margin8 = 8.0;
  static const double borderRadius = 10.0;

  static const colorPrimary = Colors.deepPurple;

  // region TextStyle

  static TextStyle get styleTitle {
    return const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30,
      color: Colors.black,
    );
  }

  static TextStyle get styleSynopsis {
    return const TextStyle(
      fontSize: 20,
      color: Colors.black,
    );
  }

  static TextStyle get stylePrice {
    return const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30,
      color: AppTheme.colorPrimary,
    );
  }

  // endregion
}
