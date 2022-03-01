import 'package:get/get.dart';
import 'package:henri_potier/utils/app_routes.dart';

class MainController extends GetxController {
  gotoScreenHome() {
    Get.toNamed(AppRoutes.screenHome);
  }
}
