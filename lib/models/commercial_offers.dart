import 'package:flutter/foundation.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/models/offer.dart';
import 'package:henri_potier/utils/log.dart';

class CommercialOffers {
  final List<Offer> offers;
  List<Book>? books;

  CommercialOffers({
    required this.offers,
  });

  factory CommercialOffers.empty() {
    return CommercialOffers(offers: []);
  }

  factory CommercialOffers.fromJson(Map<String, dynamic> json) {
    return CommercialOffers(
      offers: List<Offer>.from((json['offers'] as List<dynamic>).map((e) => Offer.fromJson(e))),
    );
  }

  int getBooksPrice() {
    int price = 0;
    books ??= [];
    for (Book book in books!) {
      price += book.price;
    }
    return price;
  }

  int getFinalPrice() {
    int booksPrice = getBooksPrice();
    int minimalPrice = booksPrice;
    for (Offer offer in offers) {
      int offerFinalPrice = offer.getFinalPrice(booksPrice);
      log("booksPrice:$booksPrice type:${describeEnum(offer.type)} value:${offer.value} sliceValue:${offer.sliceValue} = $offerFinalPrice");
      if (offerFinalPrice < minimalPrice) {
        minimalPrice = offerFinalPrice;
      }
    }
    return minimalPrice;
  }
}
