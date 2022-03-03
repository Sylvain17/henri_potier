import 'package:get/get.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/models/commercial_offers.dart';
import 'package:henri_potier/services/book_service.dart';
import 'package:henri_potier/utils/app_routes.dart';

class ControllerBasket extends GetxController {
  RxList<Book> booksInBasket = <Book>[].obs;
  Rx<CommercialOffers> commercialOffers = CommercialOffers.empty().obs;

  void addBookToBasket(Book book) async {
    gotoScreenBasket();
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

  bool isBookInBasket(Book book) {
    return booksInBasket.contains(book);
  }

  void gotoScreenBasket() {
    Get.toNamed(AppRoutes.screenBasket);
  }
}
