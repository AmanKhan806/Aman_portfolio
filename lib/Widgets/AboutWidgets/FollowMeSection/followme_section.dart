import 'package:amanportfolio/Widgets/Animated_Gradienttext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/theme_controller.dart';
import '../../../Controller/url_launcher_function.dart';
import '../../url_text.dart';

class FollowmeSection extends StatelessWidget {
  final ThemeController themeController = Get.find();
  FollowmeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    return Column(
      children: [
        !isMobile
            ? const AnimatedGradientText(
                text: "Follow Me",
                fontSize: 100,
              )
            : const AnimatedGradientText(
                text: "Follow Me",
                fontSize: 50,
              ),
        const SizedBox(height: 50.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialMediaButtons(
                socialIcon: "assets/socialIcons/instagram.png",
                onpressed: () {
                  mylaunchURL(instagramUrl);
                }),
            SocialMediaButtons(
                socialIcon: "assets/socialIcons/linkedin.png",
                onpressed: () {
                  mylaunchURL(linkedinUrl);
                }),
            SocialMediaButtons(
                socialIcon: "assets/socialIcons/youtube.png", onpressed: () 
                {
                  mylaunchURL(youtubeUrl);
                })
          ],
        ),
        const SizedBox(
          height: 50.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SocialMediaButtons(
                socialIcon: "assets/socialIcons/patreon.png", onpressed: () {
                  mylaunchURL(patreonUrl);
                }),
            GestureDetector(
              onTap: () {
                mylaunchURL(buymeaCoffeeUrl);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: themeController.glassEffectColor),
                child: Center(
                  child: Image.asset(
                    "assets/socialIcons/buymeacoffe.png",
                    width: 65,
                    height: 65,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50.0,
        ),
      ],
    );
  }
}

class SocialMediaButtons extends StatelessWidget {
  final String socialIcon;
  final VoidCallback onpressed;
  SocialMediaButtons({
    super.key,
    required this.socialIcon,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: themeController.glassEffectColor),
        child: Center(
          child: Image.asset(
            socialIcon,
          ),
        ),
      ),
    );
  }
}
