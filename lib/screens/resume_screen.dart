import 'package:amanportfolio/Widgets/Animated_Gradienttext.dart';
import 'package:amanportfolio/screens/contactus_screen.dart';
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
import '../utils/responsive_utils/responsive_utils.dart';

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
                  ResumeScreenWidget(),
                  FiveSection(),
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
    final responsive = ResponsiveUtils(context);
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
                !responsive.isMobile
                    ? CustomNavigationBar()
                    : const CustomNavigationBarforMobile(),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: !responsive.isMobile
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
                              width: responsive.imageWidth,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: responsive.avatarGlowSize,
                        height: responsive.avatarGlowSize,
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
                      _buildOverviewContent(context),
                      _buildExperienceContent(context),
                      _buildSkillsContent(context),
                      _buildEducationContent(context),
                      _buildProjectsContent(context),
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

  Widget _buildOverviewContent(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: responsive.screenWidth > 600 ? 20.0 : 15.0,
            vertical: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsive.sectionSpacing + 5),
            Container(
              decoration: BoxDecoration(
                color: themeController.glassEffectColor,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              padding: EdgeInsets.all(responsive.containerPadding),
              child: Text(
                "P R O F I L E   S U M M A R Y",
                style: GoogleFonts.ubuntu(
                  color: themeController.textColor,
                  fontSize: responsive.headingFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: responsive.sectionSpacing),
            Text(
              "With 2 years of development experience, including 1 year in Flutter, I build responsive mobile apps using Dart.\nMy skills include state management (GetX), API integration (Firebase, REST), and performance optimization.\nI focus on high-quality code and stay updated on Flutter advancements to deliver innovative solutions.",
              style: GoogleFonts.ubuntu(
                color: themeController.textColor,
                fontSize: responsive.textFontSize,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: responsive.sectionSpacing),
            Container(
              decoration: BoxDecoration(
                color: themeController.glassEffectColor,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              padding: EdgeInsets.all(responsive.containerPadding),
              child: Text(
                "L A N G U A G E S",
                style: GoogleFonts.ubuntu(
                  color: themeController.textColor,
                  fontSize: responsive.headingFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: responsive.sectionSpacing),
            Text(
              "English",
              style: GoogleFonts.ubuntu(
                color: themeController.textColor,
                fontSize: responsive.textFontSize,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: responsive.sectionSpacing / 2),
            Text(
              "Urdu",
              style: GoogleFonts.ubuntu(
                color: themeController.textColor,
                fontSize: responsive.textFontSize,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: responsive.sectionSpacing / 2),
          ],
        ),
      ),
    );
  }

  Widget _buildExperienceContent(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.containerPadding,
          vertical: responsive.sectionSpacing,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsive.sectionSpacing + 5),
            Container(
              decoration: BoxDecoration(
                color: themeController.glassEffectColor,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              padding: EdgeInsets.all(responsive.containerPadding),
              child: Text(
                "W O R K   E X P E R I E N C E",
                style: GoogleFonts.ubuntu(
                  color: themeController.textColor,
                  fontSize: responsive.headingFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: responsive.sectionSpacing),
            ExperienceWidget(
              themeController: themeController,
              imageUrl: 'assets/orio.jpg',
              companyName: 'Orio Tech',
              disignation: 'Flutter Developer',
              timeText: 'FEB 2024 - PRESENT',
              description:
                  'At Orio Technology, I develop and maintain cross-platform mobile apps using Flutter. My responsibilities include implementing UI/UX designs, integrating APIs, and ensuring high performance. I focus on enhancing app efficiency and user experience while staying updated on the latest Flutter trends.',
            ),
            SizedBox(height: responsive.sectionSpacing),
            ExperienceWidget(
              themeController: themeController,
              imageUrl: 'assets/vative.jpg',
              companyName: 'Vative Mobile Apps',
              disignation: 'Jnr Flutter Developer',
              timeText: 'Aug 2024 - Oct 2024',
              description:
                  'At Vative Apps, I develop and maintain cross-platform mobile apps using Flutter. My responsibilities include implementing UI/UX designs, integrating APIs, Firebase, and Socket.IO, and ensuring high performance. I focus on enhancing app efficiency and user experience while staying updated on the latest Flutter trends.',
            ),
            SizedBox(height: responsive.sectionSpacing),
            ExperienceWidget(
              themeController: themeController,
              imageUrl: 'assets/itistic.jpg',
              companyName: 'Itistic Solutions',
              disignation: 'Jnr Flutter Developer (App Designs)',
              timeText: 'Apr 2023 - Jul 2023',
              description:
                  'Developed and designed cross-platform mobile applications using Flutter. Created responsive and visually appealing user interfaces with Dart. Utilized state management techniques like GetX, focused on performance optimization and automated testing, and designed new and trending app interfaces.',
            ),
            SizedBox(height: responsive.sectionSpacing),
            ExperienceWidget(
              themeController: themeController,
              imageUrl: 'assets/fiver.jpg',
              companyName: 'Fiver',
              disignation: 'Freelance MobileApp Developer\nor Web Developer',
              timeText: 'Jan 2023 - Present',
              description: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillsContent(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        child: responsive.isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: themeController.glassEffectColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "S K I L L S",
                          style: GoogleFonts.ubuntu(
                            color: themeController.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ..._buildSkillsList(),
                    ],
                  ),
                  const SizedBox(
                    width: 60.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: themeController.glassEffectColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "P A T T E R N",
                          style: GoogleFonts.ubuntu(
                            color: themeController.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ..._buildPatternList(),
                    ],
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: themeController.glassEffectColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "S K I L L S",
                          style: GoogleFonts.ubuntu(
                            color: themeController.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ..._buildSkillsList(),
                    ],
                  ),
                  const SizedBox(
                    width: 60.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: themeController.glassEffectColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "P A T T E R N",
                          style: GoogleFonts.ubuntu(
                            color: themeController.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ..._buildPatternList(),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildEducationContent(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.containerPadding,
          vertical: responsive.sectionSpacing,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsive.sectionSpacing + 5),
            Container(
              decoration: BoxDecoration(
                color: themeController.glassEffectColor,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              padding: EdgeInsets.all(responsive.containerPadding),
              child: Text(
                "E D U C A T I O N",
                style: GoogleFonts.ubuntu(
                  color: themeController.textColor,
                  fontSize: responsive.headingFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: responsive.sectionSpacing),
            ExperienceWidget(
              themeController: themeController,
              imageUrl: 'assets/ali.png',
              companyName: 'ALI INTERMEDIATE COLLEGE',
              disignation: 'Intermediate Level in Computer Science',
              timeText: '2022 - 2024',
              description: 'Grade A',
            ),
             SizedBox(
              height: responsive.sectionSpacing,
            ),
            ExperienceWidget(
                themeController: themeController,
                imageUrl: 'assets/aptech.jpg',
                companyName: 'APTECH LEARNING',
                disignation: 'Diploma in Software Engineering',
                timeText: '2021 - 2024',
                description: 'Grade Distinction'),
             SizedBox(height: responsive.sectionSpacing),
            ExperienceWidget(
                themeController: themeController,
                imageUrl: 'assets/lincoln.jpg',
                companyName: 'LINCOLN UNIVERSITY COLLEGE',
                disignation: 'Bachelor in Computer Science',
                timeText: '2024 - 2026',
                description: 'GPA 3.5'),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsContent(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        child: responsive.isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: themeController.glassEffectColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "L I V E  P R O J E C T S",
                          style: GoogleFonts.ubuntu(
                            color: themeController.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ..._buildliveProjects(),
                    ],
                  ),
                  const SizedBox(
                    width: 60.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: themeController.glassEffectColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "P R O J E C T S",
                          style: GoogleFonts.ubuntu(
                            color: themeController.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ..._buildProject(),
                    ],
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: themeController.glassEffectColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "L I V E  P R O J E C T S",
                          style: GoogleFonts.ubuntu(
                            color: themeController.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ..._buildliveProjects(),
                    ],
                  ),
                  const SizedBox(
                    width: 60.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Container(
                        decoration: BoxDecoration(
                          color: themeController.glassEffectColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          "P R O J E C T S",
                          style: GoogleFonts.ubuntu(
                            color: themeController.textColor,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      ..._buildProject(),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildContactContent() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
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
              bool isMobile = constraints.maxWidth < 600;
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
                          textTwo: '',
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
                          textTwo: '',
                          icon: Icons.link,
                          iconData: true,
                        ),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSkillsList() {
    final skills = [
      "Flutter Ui",
      "Figma to Flutter Code",
      "Integration (RestFul API’S)",
      "Handling (RestFul API’S)",
      "Interceptors",
      "Clean & Readable Code",
      "Flutter Services",
      "Social Logins",
      "Debugging",
      "Bug Fixes",
      "Unit Testing",
      "CI/CD Pipeline",
      "Isolates",
      "Firebase",
      "Flutter Packages",
      "Github",
      "FVM",
      "Localization",
      "Supa Base",
    ];

    return skills
        .map(
          (skill) => Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: _buildSkillsText(skill, themeController.textColor),
          ),
        )
        .toList();
  }

  List<Widget> _buildPatternList() {
    final patternList = [
      "Model View Controller (MVC)",
      "Model View View Model (MVVM)",
      "Model View Presentation (MVP)"
    ];

    return patternList
        .map(
          (pattern) => Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: _buildSkillsText(pattern, themeController.textColor),
          ),
        )
        .toList();
  }

  List<Widget> _buildliveProjects() {
    final liveProjects = [
      "GMJ (Flutter)",
      "OMS (Orio Management System) (Flutter)",
      "DealsAbaad (Flutter)",
      "Jubilee Motor App (Flutter)",
      "Jubilee Takaful App (Flutter)",
      "Cravo Rider App (MVP Pattern) (Flutter)",
    ];

    return liveProjects
        .map(
          (liveProject) => Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: _buildSkillsText(liveProject, themeController.textColor),
          ),
        )
        .toList();
  }

  List<Widget> _buildProject() {
    final projects = [
      "Laptop Harbor (Flutter)",
      "Pico Chat (Flutter",
      "Paric Cosmatic App (Flutter"
    ];

    return projects
        .map(
          (project) => Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: _buildSkillsText(project, themeController.textColor),
          ),
        )
        .toList();
  }

  Widget _buildSkillsText(String skillText, Color mycolor) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: mycolor,
          minRadius: 3.0,
          maxRadius: 3.0,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          skillText,
          style: GoogleFonts.ubuntu(
            color: mycolor,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.start,
        ),
      ],
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
    final responsive = ResponsiveUtils(context);

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
                    width: responsive.imageWidth / 4,
                    height: responsive.imageWidth / 4,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: responsive.sectionSpacing / 2),
                Text(
                  companyName,
                  style: GoogleFonts.ubuntu(
                    color: themeController.textColor,
                    fontSize: responsive.textFontSize,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: responsive.sectionSpacing / 3),
                Text(
                  disignation,
                  style: GoogleFonts.ubuntu(
                    color: themeController.textColor,
                    fontSize: responsive.textFontSize,
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
                fontSize: responsive.textFontSize,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        SizedBox(height: responsive.sectionSpacing / 2),
        Text(
          description,
          style: GoogleFonts.ubuntu(
            color: themeController.textColor,
            fontSize: responsive.textFontSize,
            fontWeight: FontWeight.normal,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
