import 'package:get/get.dart';
import '../utils/routes/App_pages_routes.dart';

class NavigationController extends GetxController {
  var activeTab = 'Home'.obs;

  void updateActiveTabAndNavigate(String tabName) {
    activeTab.value = tabName;
    switch (tabName) {
      case 'Home':
        Get.toNamed(AppPages.home);
        break;
      case 'About':
        Get.toNamed(AppPages.about);
        break;
      case 'Portfolio':
        Get.toNamed(AppPages.portfolio);
        break;
      case 'Contact':
        Get.toNamed(AppPages.contact);
        break;
      default:
        break;
    }
  }
}
