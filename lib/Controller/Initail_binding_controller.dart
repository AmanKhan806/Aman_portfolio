import 'package:amanportfolio/Controller/All_Section_Controller.dart';
import 'package:amanportfolio/Controller/Navigation_controller.dart';
import 'package:amanportfolio/Controller/theme_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AllSectionController());
    Get.put(ThemeController());
    Get.put(NavigationController());
  }
}
