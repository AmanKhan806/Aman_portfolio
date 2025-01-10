import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/rotation_controller.dart';
import '../../../Controller/theme_controller.dart';

class FiveSection extends StatelessWidget {
  final RotationController rotationController = Get.put(RotationController());
  final ThemeController themeController = Get.put(ThemeController());
  FiveSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Obx(
      () => Container(
        color: themeController.containerColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: themeController.textColor,
                        radius: isMobile ? 15.0 : 20.0,
                        child: Text(
                          "AK",
                          style: GoogleFonts.ubuntu(
                            fontWeight: FontWeight.bold,
                            color: themeController.logotextColor,
                            fontSize: isMobile ? 12.0 : 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        "Aman Khan",
                        style: GoogleFonts.ubuntu(
                          color: themeController.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: isMobile ? 14.0 : 18.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "LET'S WORK",
                    style: GoogleFonts.ubuntu(
                      color: themeController.textColor,
                      fontSize: isMobile ? 30 : 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "T ",
                        style: GoogleFonts.ubuntu(
                          color: themeController.textColor,
                          fontSize: isMobile ? 30 : 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CircleAvatar(
                        radius: 25,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/picture1.png'),
                        ),
                      ),
                      Text(
                        " GETHER",
                        style: GoogleFonts.ubuntu(
                          color: themeController.textColor,
                          fontSize: isMobile ? 30 : 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {},
                    child: RotationTransition(
                      turns: rotationController.animationController,
                      child: Container(
                        height: isMobile ? 80 : 100,
                        width: isMobile ? 80 : 100,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              ColorResources.appMainColor,
                              Color.fromARGB(255, 236, 165, 58)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color:
                                  ColorResources.appMainColor.withOpacity(0.6),
                              blurRadius: 20,
                              spreadRadius: 3,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_outward,
                            size: isMobile ? 30 : 40,
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  Wrap(
                    spacing: 10.0,
                    alignment: WrapAlignment.center,
                    children: [
                      FiveSectionWidget(
                        butonText: 'Home',
                        onPressed: () {},
                      ),
                      FiveSectionWidget(
                        butonText: 'About',
                        onPressed: () {},
                      ),
                      FiveSectionWidget(
                        butonText: 'Resume',
                        onPressed: () {},
                      ),
                      FiveSectionWidget(
                        butonText: 'Portfolio',
                        onPressed: () {},
                      ),
                      FiveSectionWidget(
                        butonText: 'Contact',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                decoration:  const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: ColorResources.appMainColor,
                  ),
                child: Text(
                  '© 2025 Aman Khan. All Rights Reserved.',
                  style: GoogleFonts.ubuntu(
                    color: ColorResources.whiteColor,
                    fontSize: isMobile ? 12.0 : 14.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FiveSectionWidget extends StatelessWidget {
  final String butonText;
  final VoidCallback onPressed;
  const FiveSectionWidget({
    super.key,
    required this.butonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return TextButton(
      onPressed: onPressed,
      child: Text(
        butonText,
        style: GoogleFonts.ubuntu(
          color: themeController.textColor,
          fontSize: isMobile ? 14.0 : 16.0,
        ),
      ),
    );
  }
}
