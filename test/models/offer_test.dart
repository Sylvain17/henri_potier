import 'package:flutter_test/flutter_test.dart';
import 'package:henri_potier/models/offer.dart';

void main() {
  group('Test Offer class public methods', () {
    test('check getFinalPrice for EnumOfferType.percentage', () {
      Offer offer = Offer(
        type: EnumOfferType.percentage,
        value: 5,
        sliceValue: 0,
      );
      expect(offer.getFinalPrice(100), 95);
      expect(offer.getFinalPrice(50), 48);

      Offer offerHack = Offer(
        type: EnumOfferType.percentage,
        value: 200,
        sliceValue: 0,
      );
      expect(offerHack.getFinalPrice(100), 100);
    });

    test('check getFinalPrice for EnumOfferType.minus', () {
      Offer offer = Offer(
        type: EnumOfferType.minus,
        value: 12,
        sliceValue: 0,
      );
      expect(offer.getFinalPrice(100), 88);
      expect(offer.getFinalPrice(50), 38);

      Offer offerHack = Offer(
        type: EnumOfferType.minus,
        value: 200,
        sliceValue: 0,
      );
      expect(offerHack.getFinalPrice(100), 100);
    });

    test('check getFinalPrice for EnumOfferType.slice', () {
      Offer offer = Offer(
        type: EnumOfferType.slice,
        value: 10,
        sliceValue: 50,
      );
      expect(offer.getFinalPrice(100), 80);
      expect(offer.getFinalPrice(50), 40);

      Offer offerHack = Offer(
        type: EnumOfferType.slice,
        value: 200,
        sliceValue: 10,
      );
      expect(offerHack.getFinalPrice(100), 100);
    });

    test('check getFinalPrice for EnumOfferType.unknown', () {
      Offer offer = Offer(
        type: EnumOfferType.unknown,
        value: 12,
        sliceValue: 0,
      );
      expect(offer.getFinalPrice(100), 100);
      expect(offer.getFinalPrice(50), 50);

      Offer offerHack = Offer(
        type: EnumOfferType.unknown,
        value: 200,
        sliceValue: 0,
      );
      expect(offerHack.getFinalPrice(100), 100);
    });
  });
}
