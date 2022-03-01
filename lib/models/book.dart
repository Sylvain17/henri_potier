class Book {
  final String isbn;
  final String title;
  final String cover;
  final int price;

  Book({
    required this.isbn,
    required this.title,
    required this.cover,
    required this.price,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      isbn: json['isbn'] as String,
      title: json['title'] as String,
      cover: json['cover'] as String,
      price: json['price'] as int,
    );
  }
}
