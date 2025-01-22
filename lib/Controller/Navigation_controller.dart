import 'package:amanportfolio/screens/Home_Screen.dart';
import 'package:amanportfolio/screens/about_screen.dart';
import 'package:amanportfolio/screens/contactus_screen.dart';
import 'package:amanportfolio/screens/view_all_project.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var activeTab = 'Home'.obs;

  void updateActiveTabAndNavigate(String tabName) {
    activeTab.value = tabName;
    switch (tabName) {
      case 'Home':
        Get.to(() => HomeScreen(), transition: Transition.fadeIn);
        break;
      case 'About':
        Get.to(() => AboutScreen(), transition: Transition.fadeIn);
        break;
      case 'Resume':
        break;
      case 'Portfolio':
        Get.to(() => ViewAllProject(), transition: Transition.fadeIn);
        break;
      case 'Contact':
        Get.to(() => ContactusScreen(), transition: Transition.fadeIn);
        break;
      default:
        break;
    }
  }
}

