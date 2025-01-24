import 'package:amanportfolio/Widgets/Animated_Gradienttext.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:amanportfolio/Widgets/HomeWidgets/fiveSection/five_section.dart';
import 'package:amanportfolio/Widgets/floatingActionButton.dart';
import 'package:amanportfolio/Widgets/navigation_bar.dart';
import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/All_Section_Controller.dart';
import '../Controller/theme_controller.dart';

class ResumeScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final ScrollController _scrollController = ScrollController();

  ResumeScreen({super.key});

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
                  ResumeScreenWidget(), // Resume widget with tabs
                  FiveSection(), // Other sections
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: floatingActionsbutton(
          scrollController: _scrollController,
        ),
      ),
    );
  }
}

class ResumeScreenWidget extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final AllSectionController controller = Get.find();

  ResumeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    double imageWidth = screenWidth > 800 ? 280 : 180;
    double avatarGlowSize = screenWidth > 800 ? 350 : 250;

    return DefaultTabController(
      length: 6,
      child: Obx(
        () => Container(
          color: themeController.containerColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                !isMobile
                    ? CustomNavigationBar()
                    : const CustomNavigationBarforMobile(),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: !isMobile
                      ? const AnimatedGradientText(
                          text: "Check My Resume",
                          fontSize: 100,
                        )
                      : const Center(
                          child: AnimatedGradientText(
                            text: "Check My Resume",
                            fontSize: 25,
                          ),
                        ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                    indicatorColor: ColorResources.appMainColor,
                    labelColor: ColorResources.appMainColor,
                    unselectedLabelColor: themeController.textColor,
                    physics: const BouncingScrollPhysics(),
                    labelStyle: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 45),
                    tabs: const [
                      Tab(text: "Summary"),
                      Tab(text: "Experience"),
                      Tab(text: "Skills"),
                      Tab(text: "Education"),
                      Tab(text: "Projects"),
                      Tab(text: "Contact"),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: TabBarView(
                    children: [
                      _buildOverviewContent(),
                      _buildExperienceContent(),
                      _buildSkillsContent(),
                      _buildEducationContent(),
                      _buildProjectsContent(),
                      _buildContactContent(),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: themeController.glassEffectColor,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "P R O F I L E   S U M M A R Y",
                style: GoogleFonts.ubuntu(
                  color: themeController.textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              "With 2 years of development experience, including 1 years in Flutter, I build responsive mobile apps using Dart.\nMy skills include state management (GetX), API integration (Firebase, REST), and performance optimization.\nI focus on high-quality code and stay updated on Flutter advancements to deliver innovative solutions.",
              style: GoogleFonts.ubuntu(
                color: themeController.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 15.0),
            Container(
              decoration: BoxDecoration(
                color: themeController.glassEffectColor,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "L A N G U A G E S",
                style: GoogleFonts.ubuntu(
                  color: themeController.textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Text(
              "English",
              style: GoogleFonts.ubuntu(
                color: themeController.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10.0),
            Text(
              "Urdu",
              style: GoogleFonts.ubuntu(
                color: themeController.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceContent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: themeController.glassEffectColor,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "W O R K   E X P E R I E N C E",
                style: GoogleFonts.ubuntu(
                  color: themeController.textColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            ExperienceWidget(
              themeController: themeController,
              imageUrl: 'assets/orio.jpg',
              companyName: 'Orio Tech',
              disignation: 'Flutter Developer',
              timeText: 'FEB 2024 - PRESENT',
              description:
                  'At Orio Technology, I develop and maintain cross-platform mobile apps using Flutter. My responsibilities include implementing UI/UX designs, integrating APIs, and ensuring high performance. I focus on enhancing app efficiency and user experience while staying updated on the latest Flutter trends.',
            ),
            const SizedBox(height: 15.0),
            ExperienceWidget(
              themeController: themeController,
              imageUrl: 'assets/vative.jpg',
              companyName: 'Vative Mobile Apps',
              disignation: 'Jnr Flutter Daveloper',
              timeText: 'Aug 2024 - Oct 2024',
              description:
                  'At Vative Apps, I develop and maintain cross-platform mobile apps using Flutter. My responsibilities include implementing UI/UX designs, integrating APIs, Firebase, and Socket.IO, and ensuring high performance. I focus on enhancing app efficiency and user experience while staying updated on the latest Flutter trends',
            ),
            const SizedBox(height: 15.0),
            ExperienceWidget(
              themeController: themeController,
              imageUrl: 'assets/itistic.jpg',
              companyName: 'Itistic Solutions',
              disignation: 'Jnr Flutter Developer (App Designs)',
              timeText: 'Apr 2023 - Jul 2023',
              description:
                  'Developed and designed cross-platform mobile applications using Flutter. Created responsive and visually appealing user interfaces with Dart. Utilized state management techniques like GetX, focused on performance optimization and automated testing, and designed new and trending app interfaces',
            ),
            const SizedBox(height: 15.0),
            ExperienceWidget(
              themeController: themeController,
              imageUrl: 'assets/fiver.jpg',
              companyName: 'Fiver',
              disignation: 'Freelance MobileApp Developer or Web Developer',
              timeText: 'Jan 2023 - Present',
              description: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsContent() {
    return const Center(
      child: Text(
        "Skills Section",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildEducationContent() {
    return const Center(
      child: Text(
        "Education Section",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildProjectsContent() {
    return const Center(
      child: Text(
        "Projects Section",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildContactContent() {
    return const Center(
      child: Text(
        "Contact Section",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ExperienceWidget extends StatelessWidget {
  final String imageUrl;
  final String companyName;
  final String disignation;
  final String timeText;
  final String description;
  const ExperienceWidget({
    super.key,
    required this.themeController,
    required this.imageUrl,
    required this.companyName,
    required this.disignation,
    required this.timeText,
    required this.description,
  });

  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    imageUrl,
                    width: 70,
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  companyName,
                  style: GoogleFonts.ubuntu(
                    color: themeController.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  disignation,
                  style: GoogleFonts.ubuntu(
                    color: themeController.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Text(
              timeText,
              style: GoogleFonts.ubuntu(
                color: themeController.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          description,
          style: GoogleFonts.ubuntu(
            color: themeController.textColor,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
