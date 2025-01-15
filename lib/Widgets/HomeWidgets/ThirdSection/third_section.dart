import 'package:amanportfolio/utils/Colors/custom_colors.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../../Controller/All_Section_Controller.dart';
import '../../../Controller/theme_controller.dart';
import '../../custom_button.dart';

class ThirdSection extends StatelessWidget {
 final AllSectionController controller = Get.find();
final ThemeController themeController = Get.find();

  ThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    // controller.fetchThirdSectionData();
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: ColorResources.blackColor),
        );
      }
      if (controller.thirdSectionData.isEmpty) {
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
      double screenWidth = MediaQuery.of(context).size.width;
      int crossAxisCount = screenWidth > 1200
          ? 5
          : screenWidth > 800
              ? 3
              : 2;
      return Container(
        color: themeController.containerColor,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "I SPECIALIZE IN A\nRANGE OF ",
                    style: GoogleFonts.ubuntu(
                      color: themeController.textColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Image.asset(
                        'assets/arm.png',
                        height: 35,
                        width: 35,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: " SKILLS",
                    style: GoogleFonts.ubuntu(
                      color: themeController.textColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: screenWidth > 800 ? 1 : 0.8,
              ),
              itemCount: controller.thirdSectionData.length,
              itemBuilder: (context, index) {
                var data = controller.thirdSectionData[index];
                return ThirdPageWidget(
                  imageString: data['image'] ?? 'assets/default.png',
                  headingOne: data['heading'] ?? 'No Heading',
                );
              },
            ),
            const SizedBox(height: 20.0),
            Lottie.asset(
              'assets/lottie.json',
              width: screenWidth * 0.9,
              height: MediaQuery.of(context).size.height * 0.30,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20.0),
            CustomButton(
              buttonText: 'View More',
              isbuttonShow: false,
              onPressed: () {},
            ),
          ],
        ),
      );
    });
  }
}

class ThirdPageWidget extends StatelessWidget {
  final String imageString;
  final String headingOne;

  const ThirdPageWidget({
    super.key,
    required this.imageString,
    required this.headingOne,
  });

  @override
  Widget build(BuildContext context) {
    final ThirdPageController controller = Get.put(ThirdPageController());
    final ThemeController themeController = Get.find<ThemeController>();
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      return MouseRegion(
        onEnter: (_) => controller.setHover(true),
        onExit: (_) => controller.setHover(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: themeController.containerColor,
            border: Border.all(
              color: controller.isHovered.value
                  ? ColorResources.appMainColor
                  : themeController.textColor,
              width: 1.0,
            ),
            boxShadow: controller.isHovered.value
                ? [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageString,
                  fit: BoxFit.cover,
                  color: themeController.textColor,
                ),
              ),
              const SizedBox(height: 12.0),
              Text(
                headingOne,
                style: GoogleFonts.ubuntu(
                  color: themeController.textColor,
                  fontSize: screenWidth > 800 ? 18 : 14,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    });
  }
}
