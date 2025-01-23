import 'package:get/get.dart';

import '../../screens/Home_Screen.dart';
import '../../screens/about_screen.dart';
import '../../screens/contactus_screen.dart';
import '../../screens/view_all_project.dart';

class AppPages {
  static const home = '/home';
  static const about = '/about';
  static const portfolio = '/portfolio';
  static const contact = '/contact';

  static List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: about,
      page: () => AboutScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: portfolio,
      page: () => ViewAllProject(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: contact,
      page: () => ContactusScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
