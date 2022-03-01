import 'package:get/get.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/services/book_service.dart';

class ControllerMain extends GetxController {
  RxBool areBooksLoaded = false.obs;
  RxList<Book> books = <Book>[].obs;

  @override
  void onInit() {
    super.onInit();

    retrieveBooks();
  }

  retrieveBooks() {
    areBooksLoaded.value = false;
    books.clear();
    BookService().getBooks().then((bookList) {
      areBooksLoaded.value = true;
      books.clear();
      books.addAll(bookList);
    });
  }
}
