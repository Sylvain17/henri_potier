import 'package:get/get.dart';
import 'package:henri_potier/utils/app_routes.dart';
import 'package:henri_potier/utils/log.dart';

class ControllerSplash extends GetxController {
  @override
  void onInit() {
    super.onInit();

    log("hereeeeeeeeeeee");
    Future.delayed(const Duration(seconds: 2)).then((value) => gotoScreenHome());
  }

  gotoScreenHome() {
    Get.toNamed(AppRoutes.screenHome);
  }
}