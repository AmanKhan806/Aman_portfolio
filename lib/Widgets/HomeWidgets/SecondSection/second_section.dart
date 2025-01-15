import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/theme_controller.dart';
import '../../custom_button.dart';

class SecondSection extends StatelessWidget {
  const SecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    double screenWidth = MediaQuery.of(context).size.width;
    double baseFontSize = screenWidth > 800 ? 20 : 16;
    double headingFontSize = screenWidth > 800 ? 38 : 28;
    double imageSize = screenWidth > 800 ? 50 : 40;

    return Obx(
      () => Container(
        color: themeController.containerColor,
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth > 800 ? 40.0 : 20.0,
          vertical: screenWidth > 800 ? 40.0 : 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/waving.png',
                  height: imageSize,
                  width: imageSize,
                ),
                RichText(
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
                GradientText(
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
            const SizedBox(
              height: 25.0,
            ),
            CustomButton(
              buttonText: 'More Info About me',
              isbuttonShow: false,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Gradient gradient;

  const GradientText({
    super.key,
    required this.text,
    required this.style,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}
