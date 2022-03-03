import 'package:flutter_test/flutter_test.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/models/commercial_offers.dart';
import 'package:henri_potier/models/offer.dart';

void main() {
  group('Test CommercialOffers class public methods', () {
    test('check getBooksPrice', () {
      CommercialOffers commercialOffers = CommercialOffers.empty()..books = [];
      Book book1 = Book(isbn: "", title: "", cover: "", price: 30, synopsis: [], searchableText: "");
      Book book2 = Book(isbn: "", title: "", cover: "", price: 40, synopsis: [], searchableText: "");
      Book book3 = Book(isbn: "", title: "", cover: "", price: 50, synopsis: [], searchableText: "");
      commercialOffers.books!.add(book1);
      expect(commercialOffers.getBooksPrice(), 30);
      commercialOffers.books!.add(book2);
      expect(commercialOffers.getBooksPrice(), 70);
      commercialOffers.books!.add(book3);
      expect(commercialOffers.getBooksPrice(), 120);
    });

    test('check getFinalPrice', () {
      CommercialOffers commercialOffers = CommercialOffers.empty()..books = [];
      Book book1 = Book(isbn: "", title: "", cover: "", price: 30, synopsis: [], searchableText: "");
      Book book2 = Book(isbn: "", title: "", cover: "", price: 40, synopsis: [], searchableText: "");
      Book book3 = Book(isbn: "", title: "", cover: "", price: 50, synopsis: [], searchableText: "");
      commercialOffers.books!.add(book1);
      commercialOffers.books!.add(book2);
      commercialOffers.books!.add(book3);
      expect(commercialOffers.getBooksPrice(), 120);

      commercialOffers.offers.add(Offer(
        type: EnumOfferType.minus,
        value: 200,
        sliceValue: 0,
      ));
      commercialOffers.offers.add(Offer(
        type: EnumOfferType.percentage,
        value: 5,
        sliceValue: 0,
      ));
      commercialOffers.offers.add(Offer(
        type: EnumOfferType.minus,
        value: 20,
        sliceValue: 0,
      ));
      commercialOffers.offers.add(Offer(
        type: EnumOfferType.slice,
        value: 10,
        sliceValue: 40,
      ));
      expect(commercialOffers.getFinalPrice(), 90);
    });
  });
}
