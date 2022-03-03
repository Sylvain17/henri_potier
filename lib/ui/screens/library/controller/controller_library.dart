import 'package:get/get.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/services/book_service.dart';
import 'package:henri_potier/utils/app_routes.dart';

class ControllerLibrary extends GetxController {
  RxBool areBooksLoaded = false.obs;
  RxList<Book> booksAll = <Book>[].obs;
  RxList<Book> booksDisplayed = <Book>[].obs;
  Rx<Book> selectedBook = Book.empty().obs;

  @override
  void onInit() {
    super.onInit();

    retrieveBooks();
  }

  void retrieveBooks() {
    areBooksLoaded.value = false;
    booksDisplayed.clear();
    booksAll.clear();
    BookService().getBooks().then((bookList) {
      areBooksLoaded.value = true;
      booksDisplayed.clear();
      booksDisplayed.addAll(bookList);
      booksAll.clear();
      booksAll.addAll(bookList);
    });
  }

  void gotoScreenBasket() {
    Get.toNamed(AppRoutes.screenBasket);
  }

  void onSearchTextChanged(String searchedText) {
    List<Book> booksNewList = [];
    for (Book book in booksAll) {
      if (book.containsSearchedText(searchedText)) {
        booksNewList.add(book);
      }
    }
    booksDisplayed.clear();
    booksDisplayed.addAll(booksNewList);
  }

  void onBookCoverClicked(Book book) {
    selectedBook.value = book;
    Get.toNamed(AppRoutes.screenLibraryBookDetails);
  }
}
