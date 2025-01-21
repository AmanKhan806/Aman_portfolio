import 'dart:developer';

import 'package:amanportfolio/Controller/All_Section_Controller.dart';
import 'package:amanportfolio/Widgets/Animated_Gradienttext.dart';
import 'package:amanportfolio/Widgets/HomeWidgets/FourthSection/fourth_section.dart';
import 'package:amanportfolio/Widgets/floatingActionButton.dart';
import 'package:amanportfolio/Widgets/navigation_bar.dart';
import 'package:amanportfolio/screens/view_project_detail_page.dart';
import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/theme_controller.dart';
import '../Widgets/HomeWidgets/fiveSection/five_section.dart';
import '../Widgets/ViewProjectDetailPage/detail_page.dart';

class ViewAllProject extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final ScrollController _scrollController = ScrollController();

  ViewAllProject({
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
                  ViewAllProjectPage(),
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

class ViewAllProjectPage extends StatelessWidget {
  final ThemeController themeController = Get.find();
  final AllSectionController controller = Get.find();

  ViewAllProjectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

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
                      text: "View All Projects",
                      fontSize: 100,
                    )
                  : const Center(
                      child: AnimatedGradientText(
                        text: "View All Projects",
                        fontSize: 25,
                      ),
                    ),
              const SizedBox(height: 20.0),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                        color: ColorResources.blackColor),
                  );
                }
                if (controller.fourthSectionData.isEmpty) {
                  return Center(
                    child: Text(
                      "No data available",
                      style: GoogleFonts.ubuntu(
                        color: ColorResources.blackColor,
                        fontSize: 20,
                      ),
                    ),
                  );
                }
                final screenWidth = MediaQuery.of(context).size.width;
                final isMobile = screenWidth < 600;
                final isTablet = screenWidth >= 600 && screenWidth < 1024;
                final crossAxisCount = isMobile
                    ? 1
                    : isTablet
                        ? 2
                        : 3;
                return Container(
                  color: themeController.containerColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Here's a Glimpse of \n",
                                    style: GoogleFonts.ubuntu(
                                      color: themeController.textColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Some Exciting Projects\n",
                                    style: GoogleFonts.ubuntu(
                                      color: themeController.textColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "I've Done",
                                    style: GoogleFonts.ubuntu(
                                      color: themeController.textColor,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (!isMobile)
                            Image.asset(
                              'assets/LaptopUser.png',
                              cacheHeight: 70,
                              cacheWidth: 70,
                              fit: BoxFit.cover,
                            ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: isMobile ? 0.7 : 0.8,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          var data = controller.fourthSectionData[index];
                          log("Data for index $index: $data");
                          List<String> carouselImages =
                              List<String>.from(data['carousel_images'] ?? []);
                          return ProjectCard(
                            imageUrl: data['logo_url'],
                            title: data['name'],
                            description: data['description'],
                            tags: data['technologies'] != null
                                ? (data['technologies'] as List)
                                    .map((tag) => tag.toString())
                                    .toList()
                                : [],
                            onViewProject: () {
                              Get.to(ViewProjectDetailPage(
                                bannerImage: data['banner_url'],
                                appLogoImage: data['logo_url'],
                                appTextName: data['name'],
                                carouselImages: carouselImages,
                                appDesc: data['description'],
                                organizationImage: data['organization'],
                                tags: data['technologies'] != null
                                    ? (data['technologies'] as List)
                                        .map((tag) => tag.toString())
                                        .toList()
                                    : [],
                                playStoreLink: data['play_store_link'] ?? '',
                                appStoreLink: data['app_store_link'] ?? '',
                                buymeaCoffeeLink:
                                    data['buy_me_a_coffee_link'] ?? '',
                              ));
                            },
                            companyUrl: data['organization'],
                          );
                        },
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
