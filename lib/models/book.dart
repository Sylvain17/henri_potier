class Book {
  final String isbn;
  final String title;
  final String cover;
  final int price;
  final List<String> synopsis;

  Book({
    required this.isbn,
    required this.title,
    required this.cover,
    required this.price,
    required this.synopsis,
  });

  factory Book.empty() {
    return Book(isbn: "", title: "", cover: "", price: 0, synopsis: []);
  }

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      cover: json['cover'] as String,
      price: json['price'] as int,
      synopsis: List<String>.from(json['synopsis']),
    );
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
}
