import 'package:flutter/foundation.dart';

void log(String text) {
  if (kDebugMode) {
    print("DEBUG_LOG : $text");
  }
}
