import 'package:get/get.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/models/commercial_offers.dart';
import 'package:henri_potier/services/book_service.dart';
import 'package:henri_potier/utils/app_routes.dart';

class ControllerMain extends GetxController {
  RxBool areBooksLoaded = false.obs;
  RxList<Book> booksAll = <Book>[].obs;
  RxList<Book> booksDisplayed = <Book>[].obs;
  RxList<Book> booksInBasket = <Book>[].obs;
  Rx<CommercialOffers> commercialOffers = CommercialOffers.empty().obs;

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

  void addBookToBasket(Book book) async {
    gotoBasket();
    if (!booksInBasket.contains(book)) {
      booksInBasket.add(book);
      commercialOffers.value = await BookService().getCommercialOffers(booksInBasket);
    }
  }

  void removeBookFromBasket(Book book) async {
    if (booksInBasket.contains(book)) {
      booksInBasket.remove(book);
      commercialOffers.value = await BookService().getCommercialOffers(booksInBasket);
    }
  }

  void gotoBasket() {
    Get.toNamed(AppRoutes.screenBasket);
  }
}
