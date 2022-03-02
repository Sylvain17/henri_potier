import 'package:get/get.dart';
import 'package:henri_potier/models/book.dart';
import 'package:henri_potier/utils/app_routes.dart';

class ControllerLibrary extends GetxController {
  Rx<Book> selectedBook = Book.empty().obs;

  void gotoScreenBasket() {
    Get.toNamed(AppRoutes.screenBasket);
  }

  void onBookCoverClicked(Book book) {
    selectedBook.value = book;
    Get.toNamed(AppRoutes.screenLibraryBookDetails);
  }
}
