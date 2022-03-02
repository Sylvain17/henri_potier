import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/models/offer.dart';

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
      if (offerFinalPrice < minimalPrice) {
        minimalPrice = offerFinalPrice;
      }
    }
    return minimalPrice;
  }
}
