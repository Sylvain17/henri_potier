import 'package:get/get.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/models/commercial_offers.dart';
import 'package:henri_potier/services/book_service.dart';
import 'package:henri_potier/utils/app_routes.dart';

class ControllerBasket extends GetxController {
  RxList<Book> booksInBasket = <Book>[].obs;
  Rx<CommercialOffers> commercialOffers = CommercialOffers.empty().obs;
  RxBool hasCommercialOffersException = false.obs;
  RxBool areCommercialOffersLoaded = false.obs;

  Future<void> retrieveCommercialOffers() async {
    areCommercialOffersLoaded.value = false;
    hasCommercialOffersException.value = false;
    await Future.delayed(Duration(seconds: 1));
    try {
      commercialOffers.value = await BookService().getCommercialOffers(booksInBasket);
      areCommercialOffersLoaded.value = true;
    } catch (exception) {
      hasCommercialOffersException.value = true;
    }
  }

  void addBookToBasket(Book book) async {
    gotoScreenBasket();
    if (!booksInBasket.contains(book)) {
      booksInBasket.add(book);
      retrieveCommercialOffers();
    }
  }

  void removeBookFromBasket(Book book) {
    if (booksInBasket.contains(book)) {
      booksInBasket.remove(book);
      retrieveCommercialOffers();
    }
  }

  bool isBookInBasket(Book book) {
    return booksInBasket.contains(book);
  }

  void gotoScreenBasket() {
    Get.toNamed(AppRoutes.screenBasket);
  }
}
