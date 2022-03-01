import 'package:get/get.dart';
import 'package:henri_potier/utils/app_routes.dart';
import 'package:henri_potier/utils/log.dart';

class ControllerHome extends GetxController {
  void gotoScreenBasket() {
    log("here");
    Get.toNamed(AppRoutes.screenBasket);
  }
}
