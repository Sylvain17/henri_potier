import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/controllers/controller_main.dart';
import 'package:henri_potier/ui/screens/home/controller/controller_home.dart';
import 'package:henri_potier/ui/widgets/business/widget_book.dart';
import 'package:henri_potier/ui/widgets/common/widget_screen.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';

class ScreenHome extends StatelessWidget {
  final controller = Get.put(ControllerHome());
  final controllerMain = Get.find<ControllerMain>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WidgetScreen(
        title: 'Home',
        children: [
          controllerMain.areBooksLoaded.isFalse
              ? const SpinKitThreeBounce(
                  color: Colors.deepPurple,
                  size: 30,
                )
              : controllerMain.books.isEmpty
                  ? const WidgetText('Pas de livre')
                  : Expanded(
                      child: ListView.builder(
                        itemCount: controllerMain.books.length,
                        itemBuilder: (context, index) {
                          return WidgetBook(controllerMain.books[index]);
                        },
                      ),
                    )
        ],
      ),
    );
  }
}
