import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:henri_potier/ui/controllers/controller_main.dart';
import 'package:henri_potier/ui/screens/library/controller/controller_library.dart';
import 'package:henri_potier/ui/widgets/business/widget_book_cover.dart';
import 'package:henri_potier/ui/widgets/common/widget_screen.dart';
import 'package:henri_potier/ui/widgets/common/widget_text.dart';
import 'package:henri_potier/ui/widgets/common/widget_text_field.dart';
import 'package:henri_potier/utils/app_theme.dart';

class ScreenBookList extends StatelessWidget {
  final controller = Get.put(ControllerLibrary());
  final controllerMain = Get.find<ControllerMain>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WidgetScreen(
        title: 'Liste de livres',
        canGoBack: false,
        children: [
          controllerMain.areBooksLoaded.isFalse
              ? const SpinKitThreeBounce(
                  color: AppTheme.colorPrimary,
                  size: 30,
                )
              : Expanded(
                  child: Column(
                    children: [
                      WidgetTextField(
                        hintText: "Rechercher",
                        onTextChanged: controllerMain.onSearchTextChanged,
                      ),
                      controllerMain.books.isEmpty
                          ? Expanded(
                              child: Center(
                                child: const WidgetText('Pas de livre'),
                              ),
                            )
                          : Expanded(
                              child: SingleChildScrollView(
                                padding: const EdgeInsets.all(AppTheme.margin16),
                                child: StaggeredGrid.count(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: AppTheme.margin16,
                                  crossAxisSpacing: AppTheme.margin16,
                                  children: controllerMain.books
                                      .map(
                                        (book) => GestureDetector(
                                          onTap: () => controller.onBookCoverClicked(book),
                                          child: WidgetBookCover(book),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                            ),
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
