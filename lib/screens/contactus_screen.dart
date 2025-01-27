import 'package:amanportfolio/Widgets/Animated_Gradienttext.dart';
import 'package:amanportfolio/Widgets/floatingActionButton.dart';
import 'package:amanportfolio/Widgets/navigation_bar.dart';
import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_icons/icon_icons.dart';
import '../Controller/theme_controller.dart';
import '../Controller/url_launcher_function.dart';
import '../Widgets/HomeWidgets/fiveSection/five_section.dart';
import '../Widgets/url_text.dart';

class ContactusScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final ScrollController _scrollController = ScrollController();

  ContactusScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        endDrawer: MobileNavigationDrawer(),
        backgroundColor: themeController.containerColor,
        body: ScrollbarTheme(
          data: ScrollbarThemeData(
            thumbColor: WidgetStateProperty.all(ColorResources.appMainColor),
            thickness: WidgetStateProperty.all(8),
            radius: const Radius.circular(4),
          ),
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  ContactusProjectPage(),
                  FiveSection(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton:
            floatingActionsbutton(scrollController: _scrollController),
      ),
    );
  }
}

class ContactusProjectPage extends StatelessWidget {
  final ThemeController themeController = Get.find();

  ContactusProjectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    double imageWidth = screenWidth > 800 ? 280 : 180;
    double avatarGlowSize = screenWidth > 800 ? 350 : 250;
    return Obx(
      () => Container(
        color: themeController.containerColor,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              !isMobile
                  ? CustomNavigationBar()
                  : const CustomNavigationBarforMobile(),
              const SizedBox(height: 30),
              !isMobile
                  ? const AnimatedGradientText(
                      text: "Contact Me",
                      fontSize: 100,
                    )
                  : const Center(
                      child: AnimatedGradientText(
                        text: "Contact Me",
                        fontSize: 25,
                      ),
                    ),
              const SizedBox(height: 20.0),
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
                        child: ClipPath(
                          clipper:
                              const ShapeBorderClipper(shape: CircleBorder()),
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
              const SizedBox(height: 30.0),
              Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      bool isMobile = constraints.maxWidth < 600;
                      return isMobile
                          ? const Column(
                              children: [
                                ContactWidget(
                                  textOne: 'My Address',
                                  textTwo:
                                      'Shah Faisal Colony Block 3 Karachi , Pakistan',
                                  icon: Icons.location_city,
                                  iconData: false,
                                ),
                                SizedBox(height: 20),
                                ContactWidget(
                                  textOne: 'My Email',
                                  textTwo: '1122khanaman@gmail.com',
                                  icon: Icons.email,
                                  iconData: false,
                                ),
                              ],
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ContactWidget(
                                  textOne: 'My Address',
                                  textTwo:
                                      'Shah Faisal Colony Block 3 Karachi , Pakistan',
                                  icon: Icons.location_city,
                                  iconData: false,
                                ),
                                ContactWidget(
                                  textOne: 'My Email',
                                  textTwo: '1122khanaman@gmail.com',
                                  icon: Icons.email,
                                  iconData: false,
                                ),
                              ],
                            );
                    },
                  ),
                  const SizedBox(height: 20.0),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      bool isMobile = constraints.maxWidth <
                          600; // Treat width < 600 as mobile

                      return isMobile
                          ? const Column(
                              children: [
                                ContactWidget(
                                  textOne: 'My Phone Number',
                                  textTwo: '+92 312-2674-410',
                                  icon: Icons.phone,
                                  iconData: false,
                                ),
                                SizedBox(height: 20),
                                ContactWidget(
                                  textOne: 'Social Profiles',
                                  textTwo:
                                      '',
                                  icon: Icons.link,
                                  iconData: true,
                                ),
                              ],
                            )
                          : const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ContactWidget(
                                  textOne: 'My Phone Number',
                                  textTwo: '+92 312-2674-410',
                                  icon: Icons.phone,
                                  iconData: false,
                                ),
                                ContactWidget(
                                 textOne: 'Social Profiles',
                                  textTwo:
                                      '',
                                  icon: Icons.link,
                                  iconData: true,
                                ),
                              ],
                            );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactWidget extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final IconData icon;
  final bool? iconData;
  const ContactWidget({
    super.key,
    required this.textOne,
    required this.textTwo,
    required this.icon,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Obx(
      () => Card(
        color: themeController.glassEffectColor,
        surfaceTintColor: themeController.glassEffectColor,
        elevation: 3,
        child: Container(
          height: 130,
          width: 450,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 38.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: ColorResources.appMainColor,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(13.0),
                child: Icon(
                  icon,
                  color: ColorResources.whiteColor,
                ),
              ),
              const SizedBox(width: 20.0),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        textOne,
                        style: GoogleFonts.ubuntu(
                          color: themeController.textColor,
                          fontSize: 14,
                        ),
                      ),
                      iconData == false
                          ? Text(
                              textTwo,
                              style: GoogleFonts.ubuntu(
                                color: themeController.textColor,
                                fontSize: 14,
                              ),
                            )
                          : Row(
                              children: [
                                IconIcons.facebook(),
                                const SizedBox(width: 10.0,),
                                IconIcons.linkedin(),
                                const SizedBox(width: 6.0,),
                                SvgPicture.asset(
                                  'assets/instagram.svg',
                                  height: 35,
                                  width: 35,
                                ),
                              ],
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
