import 'package:amanportfolio/Controller/Navigation_controller.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../../Controller/theme_controller.dart';
import '../../../Controller/url_launcher_function.dart';
import '../../../utils/Colors/custom_colors.dart';
import '../../custom_button.dart';
import '../../navigation_bar.dart';
import '../../url_text.dart';

class FirstSection extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final NavigationController navigationController =
      Get.put(NavigationController());
  FirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double headingFontSize = screenWidth > 800 ? 40 : 28;
    double subTitleFontSize = screenWidth > 800 ? 16 : 14;
    double imageWidth = screenWidth > 800 ? 280 : 180;
    double avatarGlowSize = screenWidth > 800 ? 350 : 250;
    double buttonPadding = screenWidth > 800 ? 16.0 : 12.0;

    return Obx(
      () => Container(
        color: themeController.containerColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: screenWidth > 800
              ? Column(
                  children: [
                    const SizedBox(height: 20),
                    CustomNavigationBar(),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "I’m ",
                                        style: GoogleFonts.ubuntu(
                                          color: themeController.textColor,
                                          fontSize: headingFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "M. Aman Khan",
                                        style: GoogleFonts.ubuntu(
                                          color: ColorResources.appMainColor,
                                          fontSize: headingFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "\nFlutter Developer",
                                        style: GoogleFonts.ubuntu(
                                          color: themeController.textColor,
                                          fontSize: headingFontSize,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                FirstSectionSubtitleWidget(
                                  imageString: 'assets/rocket.png',
                                  title:
                                      ' A Passionate Full Stack Mobile App Developer',
                                  fontSize: subTitleFontSize,
                                ),
                                const SizedBox(height: 15.0),
                                FirstSectionSubtitleWidget(
                                  imageString: 'assets/paint.png',
                                  title:
                                      ' With 1 Year of Industry Experience in Crafting Intuitive and Engaging Frontend Solutions',
                                  fontSize: subTitleFontSize,
                                ),
                                const SizedBox(height: 15.0),
                                FirstSectionSubtitleWidget(
                                  imageString: 'assets/phone.png',
                                  title:
                                      ' Building Seamless Mobile Applications that Bridge Innovation and User Experience ',
                                  secondImageString: "assets/star.png",
                                  fontSize: subTitleFontSize,
                                ),
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        navigationController
                                            .updateActiveTabAndNavigate(
                                                'Contact');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 40,
                                          vertical: buttonPadding,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        backgroundColor: Colors.grey[800],
                                        shadowColor: Colors.black54,
                                        elevation: 6,
                                      ),
                                      child: Text(
                                        "Let's Talk",
                                        style: GoogleFonts.ubuntu(
                                          color: Colors.white,
                                          fontSize: subTitleFontSize,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    CustomButton(
                                      buttonText: 'Download CV',
                                      buttonIcon: const Icon(
                                        Iconsax.document_download,
                                        color: ColorResources.whiteColor,
                                      ),
                                      isbuttonShow: true,
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Stack(
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
                                    surfaceTintColor: ColorResources
                                        .appMainColor
                                        .withOpacity(0.5),
                                    color: const Color.fromARGB(0, 255, 0, 0),
                                    shape: const CircleBorder(),
                                    shadowColor: ColorResources.greyOneColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipOval(
                                        child: Image.asset(
                                          "assets/picture1.png",
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
                          ),
                          Expanded(
                            flex: 0,
                            child: Column(
                              children: [
                                Transform.rotate(
                                  angle: 1.57,
                                  child: Text(
                                    'Follow me on ------------',
                                    style: GoogleFonts.ubuntu(
                                      color: ColorResources.appMainColor,
                                      fontSize: subTitleFontSize,
                                      fontWeight: FontWeight.w600,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 100.0,
                                ),
                                Transform.rotate(
                                  angle: 1.57,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: SvgPicture.asset(
                                          'assets/linkedin.svg',
                                          height: 35,
                                          width: 35,
                                        ),
                                        onPressed: () {
                                          mylaunchURL(linkedinUrl);
                                        },
                                      ),
                                      IconButton(
                                        icon: SvgPicture.asset(
                                          'assets/instagram.svg',
                                          height: 45,
                                          width: 45,
                                        ),
                                        onPressed: () {
                                          mylaunchURL(instagramUrl);
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0)
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const CustomNavigationBarforMobile(),
                    const SizedBox(height: 30),
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
                            surfaceTintColor:
                                ColorResources.appMainColor.withOpacity(0.5),
                            color: const Color.fromARGB(0, 255, 0, 0),
                            shape: const CircleBorder(),
                            shadowColor: ColorResources.greyOneColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/picture1.png",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "I’m ",
                                  style: GoogleFonts.ubuntu(
                                    color: themeController.textColor,
                                    fontSize: headingFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "M. Aman Khan",
                                  style: GoogleFonts.ubuntu(
                                    color: ColorResources.appMainColor,
                                    fontSize: headingFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nFlutter Developer",
                                  style: GoogleFonts.ubuntu(
                                    color: themeController.textColor,
                                    fontSize: headingFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          FirstSectionSubtitleWidget(
                            imageString: 'assets/rocket.png',
                            title:
                                ' A Passionate Full Stack Mobile App Developer',
                            fontSize: subTitleFontSize,
                          ),
                          const SizedBox(height: 15.0),
                          FirstSectionSubtitleWidget(
                            imageString: 'assets/paint.png',
                            title:
                                ' With 1 Year of Industry Experience in Crafting Intuitive and Engaging Frontend Solutions',
                            fontSize: subTitleFontSize,
                          ),
                          const SizedBox(height: 15.0),
                          FirstSectionSubtitleWidget(
                            imageString: 'assets/phone.png',
                            title:
                                ' Building Seamless Mobile Applications that Bridge Innovation and User Experience ',
                            secondImageString: "assets/star.png",
                            fontSize: subTitleFontSize,
                          ),
                          const SizedBox(height: 30),
                          CustomButton(
                            buttonText: 'Download CV',
                            buttonIcon: const Icon(
                              Iconsax.document_download,
                              color: ColorResources.whiteColor,
                            ),
                            isbuttonShow: true,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0)
                  ],
                ),
        ),
      ),
    );
  }
}

class FirstSectionSubtitleWidget extends StatelessWidget {
  final String imageString;
  final String? secondImageString;
  final String title;
  final double fontSize;

  const FirstSectionSubtitleWidget({
    super.key,
    required this.imageString,
    required this.title,
    this.secondImageString,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    List<InlineSpan> textSpanChildren = [
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Image.asset(
          imageString,
          height: 16,
          width: 16,
        ),
      ),
      TextSpan(
        text: title,
        style: GoogleFonts.ubuntu(
          color: themeController.textColor,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
          height: 1.5,
        ),
      ),
    ];
    if (secondImageString != null) {
      textSpanChildren.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.middle,
          child: Image.asset(
            secondImageString!,
            height: 16,
            width: 16,
          ),
        ),
      );
    }
    return RichText(
      text: TextSpan(
        children: textSpanChildren,
      ),
    );
  }
}
