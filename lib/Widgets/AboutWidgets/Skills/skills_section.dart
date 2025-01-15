import 'dart:developer';

import 'package:amanportfolio/Controller/theme_controller.dart';
import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../Controller/All_Section_Controller.dart';

class SkillsSection extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final AllSectionController controller = Get.put(AllSectionController());
  final ScrollController _scrollController = ScrollController();

  SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.fetchSkillsData();
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: ColorResources.blackColor),
        );
      }
      if (controller.skillsSectionData.isEmpty) {
        return Center(
          child: Text(
            "No data available",
            style: GoogleFonts.ubuntu(
              color: themeController.textColor,
              fontSize: 20,
            ),
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Skills ",
                    style: GoogleFonts.ubuntu(
                      color: themeController.textColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Image.asset(
                        'assets/arm.png',
                        height: 35,
                        width: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.skillsSectionData.length,
              itemBuilder: (context, index) {
                var data = controller.skillsSectionData[index];
                final percentage =
                    double.tryParse(data['skill_percentage'].toString()) ?? 0.0;

                return SkillItem(
                  imagePath: data['skill_image'],
                  skillName: data['skill_name'],
                  percentage: percentage / 100.0,
                  themeController: themeController,
                );
              },
            ),
          ],
        ),
      );
    });
  }
}

class SkillItem extends StatelessWidget {
  final String imagePath;
  final String skillName;
  final double percentage;
  final ThemeController themeController;

  const SkillItem({
    required this.imagePath,
    required this.skillName,
    required this.percentage,
    required this.themeController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          SvgPicture.network(
            imagePath,
            height: 50,
            width: 50,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  skillName,
                  style: GoogleFonts.ubuntu(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: themeController.textColor,
                  ),
                ),
                const SizedBox(height: 5),
                LinearPercentIndicator(
                  animation: true,
                  lineHeight: 8.0,
                  animationDuration: 1000,
                  percent: percentage,
                  barRadius: const Radius.circular(15),
                  progressColor: ColorResources.appMainColor,
                  backgroundColor: Colors.grey[300],
                ),
                const SizedBox(height: 5),
                Text(
                  '${(percentage * 100).toStringAsFixed(0)}%',
                  style: GoogleFonts.ubuntu(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: themeController.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
