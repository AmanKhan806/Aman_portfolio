import 'package:amanportfolio/Controller/theme_controller.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/Colors/custom_colors.dart';
import '../../HomeWidgets/SecondSection/second_section.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
    required this.imageWidth,
    required this.avatarGlowSize,
    required this.imageSize,
    required this.headingFontSize,
    required this.themeController,
    required this.baseFontSize,
  });

  final double imageWidth;
  final double avatarGlowSize;
  final double imageSize;
  final double headingFontSize;
  final ThemeController themeController;
  final double baseFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            AvatarGlow(
              glowColor: ColorResources.appMainColor,
              duration: const Duration(milliseconds: 2500),
              glowShape: BoxShape.circle,
              glowCount: 3,
              curve: Curves.easeInOutCubic,
              repeat: true,
              child: Material(
                elevation: 12.0,
                surfaceTintColor: ColorResources.appMainColor.withOpacity(0.5),
                color: const Color.fromARGB(0, 255, 0, 0),
                shape: const CircleBorder(),
                shadowColor: ColorResources.greyOneColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipPath(
                    clipper: const ShapeBorderClipper(shape: CircleBorder()),
                    child: Image.asset(
                      "assets/pic2.jpeg",
                      fit: BoxFit.cover,
                      width: imageWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                width: avatarGlowSize,
                height: avatarGlowSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.orange.withOpacity(0.1),
                      Colors.white.withOpacity(0.3),
                      Colors.transparent
                    ],
                    stops: const [0.5, 0.8, 1.0],
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/waving.png',
              height: imageSize,
              width: imageSize,
            ),
            Flexible(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello! ",
                      style: GoogleFonts.ubuntu(
                        fontSize: headingFontSize,
                        fontWeight: FontWeight.bold,
                        color: themeController.textColor,
                      ),
                    ),
                    TextSpan(
                      text: "I'm ",
                      style: GoogleFonts.ubuntu(
                        fontSize: headingFontSize,
                        fontWeight: FontWeight.w500,
                        color: themeController.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: GradientText(
                  text: "M. Aman Khan",
                  style: GoogleFonts.ubuntu(
                    fontSize: headingFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      ColorResources.appMainColor,
                      Color.fromARGB(255, 158, 89, 4),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          "A creative and driven Mobile App Developer with ",
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(
            fontSize: baseFontSize,
            fontWeight: FontWeight.normal,
            color: themeController.textColor,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.ubuntu(
              fontSize: baseFontSize,
              color: themeController.textColor,
            ),
            children: [
              TextSpan(
                text: "1 year of experience ",
                style: GoogleFonts.ubuntu(
                  fontSize: baseFontSize,
                  fontWeight: FontWeight.bold,
                  color: ColorResources.appMainColor,
                ),
              ),
              TextSpan(
                text: "in the field.",
                style: GoogleFonts.ubuntu(
                  fontSize: baseFontSize,
                  fontWeight: FontWeight.normal,
                  color: themeController.textColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "I thrive on transforming imaginative ideas into functional digital solutions,",
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(
            fontSize: baseFontSize,
            fontWeight: FontWeight.normal,
            color: themeController.textColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "constantly exploring innovative approaches to merge design with technology.",
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(
            fontSize: baseFontSize,
            fontWeight: FontWeight.normal,
            color: themeController.textColor,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.ubuntu(
              fontSize: baseFontSize,
              color: themeController.textColor,
            ),
            children: [
              TextSpan(
                text: "My expertise lies in Flutter ",
                style: GoogleFonts.ubuntu(
                  fontSize: baseFontSize,
                  fontWeight: FontWeight.normal,
                  color: themeController.textColor,
                ),
              ),
              TextSpan(
                text: "Front-End Development",
                style: GoogleFonts.ubuntu(
                  fontSize: baseFontSize,
                  fontWeight: FontWeight.bold,
                  color: ColorResources.appMainColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "where I excel at building responsive designs and crafting user-centered interfaces",
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(
            fontSize: baseFontSize,
            fontWeight: FontWeight.normal,
            color: themeController.textColor,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "While my front-end skills are strong, I’m currently focused on expanding my knowledge and skills in",
          textAlign: TextAlign.center,
          style: GoogleFonts.ubuntu(
            fontSize: baseFontSize,
            fontWeight: FontWeight.normal,
            color: themeController.textColor,
          ),
        ),
        const SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.ubuntu(
              fontSize: baseFontSize,
              color: themeController.textColor,
            ),
            children: [
              TextSpan(
                text: "Back-End Development ",
                style: GoogleFonts.ubuntu(
                  fontSize: baseFontSize,
                  fontWeight: FontWeight.bold,
                  color: ColorResources.appMainColor,
                ),
              ),
              TextSpan(
                text: "as I continue my learning journey.",
                style: GoogleFonts.ubuntu(
                  fontSize: baseFontSize,
                  fontWeight: FontWeight.normal,
                  color: themeController.textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
