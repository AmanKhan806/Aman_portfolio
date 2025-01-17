import 'package:amanportfolio/Widgets/AboutWidgets/FollowMeSection/followme_section.dart';
import 'package:amanportfolio/Widgets/Animated_Gradienttext.dart';
import 'package:amanportfolio/Widgets/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/theme_controller.dart';
import '../../Controller/All_Section_Controller.dart';
import 'AboutMe/about_me_section.dart';
import 'Skills/skills_section.dart';

class FirstSectionAbout extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final AllSectionController controller = Get.find();

  FirstSectionAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    double imageWidth = screenWidth > 800 ? 280 : 180;
    double avatarGlowSize = screenWidth > 800 ? 350 : 250;
    double baseFontSize = screenWidth > 800 ? 20 : 16;
    double headingFontSize = screenWidth > 800 ? 38 : 28;
    double imageSize = screenWidth > 800 ? 50 : 40;
    return Obx(
      () => Container(
        color: themeController.containerColor,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                !isMobile ? 
                CustomNavigationBar() : const CustomNavigationBarforMobile(),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: !isMobile
                      ? const AnimatedGradientText(
                          text: "Learn More About Me",
                          fontSize: 100,
                        )
                      : const Center(
                        child: AnimatedGradientText(
                            text: "Learn More About Me",
                            fontSize: 25,
                          ),
                      ),
                ),
                const SizedBox(height: 30.0),
                AboutMe(
                    imageWidth: imageWidth,
                    avatarGlowSize: avatarGlowSize,
                    imageSize: imageSize,
                    headingFontSize: headingFontSize,
                    themeController: themeController,
                    baseFontSize: baseFontSize),
                const SizedBox(height: 50.0),
                SkillsSection(),
                FollowmeSection(),
              ],
            )),
      ),
    );
  }
}
