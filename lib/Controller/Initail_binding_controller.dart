import 'package:amanportfolio/Controller/All_Section_Controller.dart';
import 'package:amanportfolio/Controller/theme_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AllSectionController());
    Get.put(ThemeController());
  }
}
