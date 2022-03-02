import 'package:get/get.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/services/book_service.dart';

class ControllerMain extends GetxController {
  RxBool areBooksLoaded = false.obs;
  RxList<Book> booksAll = <Book>[].obs;
  RxList<Book> books = <Book>[].obs;

  @override
  void onInit() {
    super.onInit();

    retrieveBooks();
  }

  void retrieveBooks() {
    areBooksLoaded.value = false;
    books.clear();
    booksAll.clear();
    BookService().getBooks().then((bookList) {
      areBooksLoaded.value = true;
      books.clear();
      books.addAll(bookList);
      booksAll.clear();
      booksAll.addAll(bookList);
    });
  }

  void onSearchTextChanged(String searchedText) {
    List<Book> booksNewList = [];
    for (Book book in booksAll) {
      if (book.containsSearchedText(searchedText)) {
        booksNewList.add(book);
      }
    }
    books.clear();
    books.addAll(booksNewList);
  }
}
