import 'package:diacritic/diacritic.dart';

class Book {
  final String isbn;
  final String title;
  final String cover;
  final int price;
  final List<String> synopsis;
  String? searchableText;

  Book({
    required this.isbn,
    required this.title,
    required this.cover,
    required this.price,
    required this.synopsis,
    this.searchableText,
  });

  factory Book.empty() {
    return Book(isbn: "", title: "", cover: "", price: 0, synopsis: [], searchableText: "");
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    Book book = Book(
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      cover: json['cover'] as String,
      price: json['price'] as int,
      synopsis: List<String>.from(json['synopsis']),
    );
    book.searchableText = removeDiacritics(book.title + "\n\n" + book.getSynopsisString()).toLowerCase();
    return book;
  }

  String getSynopsisString() {
    String str = "";
    for (String line in synopsis) {
      if (str.isNotEmpty) {
        str += "\n\n";
      }
      str += line;
    }
    return str;
  }

  bool containsSearchedText(String searchedText) {
    if (searchableText == null) {
      return false;
    }

    return searchableText!.contains(removeDiacritics(searchedText.trim()).toLowerCase());
  }
}
