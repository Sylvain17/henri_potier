import 'package:get/get.dart';
import 'package:henri_potier/ui/screens/basket/screen_basket.dart';
import 'package:henri_potier/ui/screens/home/screen_home.dart';
import 'package:henri_potier/ui/screens/splash/screen_splash.dart';

class AppRoutes {
  static const String screenSplash = "/splash";
  static const String screenHome = "/home";
  static const String screenBasket = "/basket";

  // Note about Bindings
  // You might be wondering if Bindings are an overkill.
  // They are! But let’s say you have 10 controllers to be injected as dependencies.
  // Declaring them in view may not look very neat.
  // In this case Bindings are the way to go.
  // https://medium.com/flutter-community/the-flutter-getx-ecosystem-dependency-injection-8e763d0ec6b9

  static final screens = [
    GetPage(
      name: screenSplash,
      page: () => ScreenSplash(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: screenHome,
      page: () => ScreenHome(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: screenBasket,
      page: () => ScreenBasket(),
      transition: Transition.noTransition,
    ),
  ];
}
