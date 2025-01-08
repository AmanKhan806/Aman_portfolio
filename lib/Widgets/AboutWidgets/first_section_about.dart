import 'package:amanportfolio/Widgets/Animated_Gradienttext.dart';
import 'package:amanportfolio/Widgets/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/theme_controller.dart';

class FirstSectionAbout extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();
  FirstSectionAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(
      () => Container(
        color: themeController.containerColor,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomNavigationBar(),
                const SizedBox(height: 30),
                const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: AnimatedGradientText(
                      text: "Learn More About Me",
                      fontSize: 100,
                    )),
                const SizedBox(height: 30.0)
              ],
            )),
      ),
    );
  }
}
