import 'package:get/get.dart';
import 'package:henri_potier/ui/screens/basket/screen_basket.dart';
import 'package:henri_potier/ui/screens/library/screen_book_details.dart';
import 'package:henri_potier/ui/screens/library/screen_book_list.dart';
import 'package:henri_potier/ui/screens/splash/screen_splash.dart';

class AppRoutes {
  static const String screenSplash = "/splash";
  static const String screenLibraryBookList = "/library/book_list";
  static const String screenLibraryBookDetails = "/library/book_details";
  static const String screenBasket = "/basket";

  static final screens = [
    GetPage(
      name: screenSplash,
      page: () => ScreenSplash(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: screenLibraryBookList,
      page: () => ScreenBookList(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: screenLibraryBookDetails,
      page: () => ScreenBookDetails(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: screenBasket,
      page: () => ScreenBasket(),
      transition: Transition.noTransition,
    ),
  ];
}
