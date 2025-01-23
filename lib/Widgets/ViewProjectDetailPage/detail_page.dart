import 'package:amanportfolio/Controller/url_launcher_function.dart';
import 'package:amanportfolio/Widgets/Animated_Gradienttext.dart';
import 'package:amanportfolio/Widgets/navigation_bar.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Controller/theme_controller.dart';
import '../../Controller/All_Section_Controller.dart';

class DetailPage extends StatelessWidget {
  final String bannerImage;
  final String appLogoImage;
  final String appTextName;
  final String appDesc;
  final String playStoreLink;
  final String appStoreLink;
  final String buymeaCoffeeLink;
  final List<String> carouselImages;
  final List<String> tags;
  final String organizationImage;
  final ThemeController themeController = Get.find();
  final AllSectionController controller = Get.find();

  DetailPage({
    super.key,
    required this.bannerImage,
    required this.appLogoImage,
    required this.appTextName,
    required this.carouselImages,
    required this.appDesc,
    required this.organizationImage,
    required this.tags,
    required this.playStoreLink,
    required this.appStoreLink,
    required this.buymeaCoffeeLink,
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
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
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
                      "Project Details",
                      style: GoogleFonts.ubuntu(
                        color: themeController.textColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      appTextName,
                      style: GoogleFonts.ubuntu(
                        color: themeController.textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      appDesc,
                      style: GoogleFonts.ubuntu(
                        color: themeController.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "Organization",
                      style: GoogleFonts.ubuntu(
                        color: themeController.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                          image: NetworkImage(organizationImage),
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
                    const SizedBox(height: 10.0),
                    Text(
                      "Technologies",
                      style: GoogleFonts.ubuntu(
                        color: themeController.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 10.0),
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
                    const SizedBox(height: 20.0),
                    if ((playStoreLink.isNotEmpty) ||
                        (appStoreLink.isNotEmpty) ||
                        (buymeaCoffeeLink.isNotEmpty))
                      Text(
                        "Download & View Project",
                        style: GoogleFonts.ubuntu(
                          color: themeController.textColor,
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    const SizedBox(height: 20.0),
                    isMobile ?
                    Column(
                      children: [
                        if (playStoreLink != null && playStoreLink.isNotEmpty)
                          Obx(
                            () => GestureDetector(
                              onTap: (){
                                  mylaunchURL(playStoreLink);
                              },
                              child: SvgPicture.asset(
                                themeController.isDarkMode.value
                                    ? 'assets/playstorelight.svg'
                                    : 'assets/playstoredark.svg',
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (appStoreLink != null && appStoreLink.isNotEmpty)
                          Obx(
                            () => GestureDetector(
                              onTap: (){
                                mylaunchURL(appStoreLink);
                              },
                              child: SvgPicture.asset(
                                themeController.isDarkMode.value
                                    ? 'assets/appstorelight.svg'
                                    : 'assets/appstoredark.svg',
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (buymeaCoffeeLink != null &&
                            buymeaCoffeeLink.isNotEmpty)
                          GestureDetector(
                            onTap: (){
                              mylaunchURL(buymeaCoffeeLink);
                            },
                            child: SvgPicture.asset(
                              'assets/buymeacoffee.svg',
                              height: 70,
                              width: 70,
                            ),
                          ),
                      ],
                    ) : Row(
                      children: [
                        if (playStoreLink != null && playStoreLink.isNotEmpty)
                          Obx(
                            () => GestureDetector(
                              onTap: (){
                                mylaunchURL(playStoreLink);
                              },
                              child: SvgPicture.asset(
                                themeController.isDarkMode.value
                                    ? 'assets/playstorelight.svg'
                                    : 'assets/playstoredark.svg',
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 20,
                        ),
                        if (appStoreLink != null && appStoreLink.isNotEmpty)
                          Obx(
                            () => GestureDetector(
                              onTap: (){
                                mylaunchURL(appStoreLink);
                              },
                              child: SvgPicture.asset(
                                themeController.isDarkMode.value
                                    ? 'assets/appstorelight.svg'
                                    : 'assets/appstoredark.svg',
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 20,
                        ),
                        if (buymeaCoffeeLink != null &&
                            buymeaCoffeeLink.isNotEmpty)
                          GestureDetector(
                            onTap: (){
                              mylaunchURL(buymeaCoffeeLink);
                            },
                            child: SvgPicture.asset(
                              'assets/buymeacoffee.svg',
                              height: 80,
                              width: 80,
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
