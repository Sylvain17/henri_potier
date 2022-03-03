import 'package:flutter/foundation.dart';

enum EnumOfferType { percentage, minus, slice, unknown }

class Offer {
  final EnumOfferType type;
  final int value;
  final int sliceValue;

  Offer({
    required this.type,
    required this.value,
    required this.sliceValue,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      type: EnumOfferType.values.firstWhere((enumOfferType) => describeEnum(enumOfferType) == json["type"], orElse: () => EnumOfferType.unknown),
      value: json['value'] as int,
      sliceValue: (json['sliceValue'] as int?) ?? 0,
    );
  }

  int getFinalPrice(int totalPrice) {
    if (type == EnumOfferType.minus) {
      return totalPrice - value;
    } else if (type == EnumOfferType.percentage) {
      return totalPrice - (totalPrice * value) ~/ 100;
    } else if (type == EnumOfferType.slice) {
      return totalPrice - ((totalPrice / sliceValue).floor() * value);
    } else {
      return totalPrice;
    }
  }
}
