import 'dart:developer';
import 'package:amanportfolio/screens/view_project_detail_page.dart';
import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/All_Section_Controller.dart';
import '../../../Controller/Navigation_controller.dart';
import '../../../Controller/theme_controller.dart';
import '../../Animated_Gradienttext.dart';
import '../../custom_button.dart';

class FourthSection extends StatelessWidget {
  final AllSectionController controller = Get.find();
  final ThemeController themeController = Get.find();
  final NavigationController navigationController =
      Get.put(NavigationController());
  FourthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: ColorResources.blackColor),
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
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
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
            Align(
              alignment: Alignment.center,
              child: !isMobile
                  ? const AnimatedGradientText(
                      text: "Flutter",
                      fontSize: 200,
                    )
                  : const AnimatedGradientText(
                      text: "Flutter",
                      fontSize: 100,
                    ),
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
                      buymeaCoffeeLink: data['buy_me_a_coffee_link'] ?? '',
                    ));
                  },
                  companyUrl: data['organization'],
                );
              },
            ),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                buttonText: 'View More',
                isbuttonShow: false,
                onPressed: () {
                  navigationController.updateActiveTabAndNavigate('Portfolio');
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class ProjectCard extends StatelessWidget {
  final String imageUrl;
  final String companyUrl;
  final String title;
  final String description;
  final List<String> tags;
  final VoidCallback onViewProject;

  const ProjectCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.tags,
    required this.onViewProject,
    required this.companyUrl,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Card(
      color: themeController.glassEffectColor,
      surfaceTintColor: themeController.glassEffectColor,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        // width: 400,
        padding: const EdgeInsets.all(26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    companyUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: GoogleFonts.ubuntu(
                color: themeController.textColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: GoogleFonts.ubuntu(
                color: themeController.textColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tags
                  .map((tag) => Chip(
                        backgroundColor: themeController.containerColor,
                        label: Text(
                          tag,
                          style: GoogleFonts.ubuntu(
                            color: themeController.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 15),
            Align(
                alignment: Alignment.centerLeft,
                child: CustomButton(
                  isbuttonShow: false,
                  buttonText: 'View Project',
                  onPressed: onViewProject,
                ))
          ],
        ),
      ),
    );
  }
}
