import 'dart:convert';

import 'package:henri_potier/models/book.dart';
import 'package:http/http.dart';

class BookService {
  final String postsURL = "https://henri-potier.techx.fr/books";

  Future<List<Book>> getBooks() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Book> books = body.map((item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw "Unable to retrieve books.";
    }
  }
}
