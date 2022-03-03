import 'dart:convert';

import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/models/commercial_offers.dart';
import 'package:henri_potier/utils/app_http_exception.dart';
import 'package:henri_potier/utils/log.dart';
import 'package:http/http.dart';

class BookService {
  final String postsURL = "https://henri-potier.techx.fr/books";

  Future<List<Book>> getBooks() async {
    try {
      Response res = await get(Uri.parse(postsURL));

      if (res.statusCode == 200) {
        List<dynamic> body = jsonDecode(res.body);
        List<Book> books = body.map((item) => Book.fromJson(item)).toList();
        return books;
      } else {
        throw AppHttpException("Unable to retrieve books");
      }
    } catch (exception) {
      throw AppHttpException("Unable to retrieve books");
    }
  }

  Future<CommercialOffers> getCommercialOffers(List<Book> books) async {
    if (books.isEmpty) {
      return CommercialOffers.empty();
    }

    String isbnList = "";
    for (Book book in books) {
      if (isbnList.isNotEmpty) {
        isbnList += ",";
      }
      isbnList += book.isbn;
    }
    log(isbnList);
    String path = "$postsURL/$isbnList/commercialOffers";

    try {
      Response res = await get(Uri.parse(path));

      if (res.statusCode == 200) {
        CommercialOffers commercialOffers = CommercialOffers.fromJson(jsonDecode(res.body));
        commercialOffers.books = books;
        return commercialOffers;
      } else {
        throw AppHttpException("Unable to retrieve commercialOffers");
      }
    } catch (exception) {
      throw AppHttpException("Unable to retrieve commercialOffers");
    }
  }
}
