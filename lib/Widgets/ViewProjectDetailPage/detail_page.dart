import 'package:amanportfolio/Widgets/Animated_Gradienttext.dart';
import 'package:amanportfolio/Widgets/navigation_bar.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controller/theme_controller.dart';
import '../../Controller/All_Section_Controller.dart';

class DetailPage extends StatelessWidget {
  final String bannerImage;
  final String appLogoImage;
  final String appTextName;
  final String appDesc;
  final List<String> carouselImages;
  final ThemeController themeController = Get.find();
  final AllSectionController controller = Get.find();

  DetailPage({
    super.key,
    required this.bannerImage,
    required this.appLogoImage,
    required this.appTextName,
    required this.carouselImages, required this.appDesc,
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
              // Navigation Bar
              !isMobile
                  ? CustomNavigationBar()
                  : const CustomNavigationBarforMobile(),
              const SizedBox(height: 30),

              // App Text Name (Heading)
              !isMobile
                  ? AnimatedGradientText(
                      text: appTextName,
                      fontSize: 100,
                    )
                  : Center(
                      child: AnimatedGradientText(
                        text: appTextName,
                        fontSize: 25,
                      ),
                    ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 2, 
                                offset: const Offset(
                                    0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                20.0),
                            child: Image.network(
                              bannerImage,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
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
                    const SizedBox(height: 70.0),
                    Text(
                      appTextName,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      appDesc,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 30.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/picture1.png"),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          "Orio",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 60.0),
                    CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.7,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        enableInfiniteScroll: true,
                      ),
                      items: carouselImages.map((url) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5.0,
                                    spreadRadius: 2.0,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: NetworkImage(url),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
