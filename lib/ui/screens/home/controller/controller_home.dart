import 'package:get/get.dart';
import 'package:henri_potier/utils/app_routes.dart';

class ControllerHome extends GetxController {
  void gotoScreenBasket() {
    Get.toNamed(AppRoutes.screenBasket);
  }
}
