import 'package:amanportfolio/Widgets/Animated_Gradienttext.dart';
import 'package:amanportfolio/Widgets/navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Controller/theme_controller.dart';
import '../../Controller/All_Section_Controller.dart';

class DetailPage extends StatelessWidget {
  final String bannerImage;
  final String appLogoImage;
  final String appTextName;
  final ThemeController themeController = Get.find();
  final AllSectionController controller = Get.find();

  DetailPage({
    super.key, required this.bannerImage, required this.appLogoImage, required this.appTextName,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Obx(
      () => Container(
        color: themeController.containerColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              !isMobile
                  ? CustomNavigationBar()
                  : const CustomNavigationBarforMobile(),
              const SizedBox(height: 30),
              const SizedBox(height: 20),
              !isMobile
                  ?  AnimatedGradientText(
                      text: appTextName,
                      fontSize: 100,
                    )
                  :  Center(
                      child: AnimatedGradientText(
                        text: appTextName,
                        fontSize: 25,
                      ),
                    ),
              const SizedBox(height: 20.0),
              Stack(
                clipBehavior: Clip.none,
                children: [
                 Image.network(bannerImage),
                  Positioned(
                    bottom: -35, 
                    left: 20,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          image: NetworkImage(appLogoImage),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}

