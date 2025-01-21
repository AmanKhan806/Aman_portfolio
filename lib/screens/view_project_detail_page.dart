import 'package:amanportfolio/Widgets/floatingActionButton.dart';
import 'package:amanportfolio/Widgets/navigation_bar.dart';
import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Controller/theme_controller.dart';
import '../Widgets/HomeWidgets/fiveSection/five_section.dart';
import '../Widgets/ViewProjectDetailPage/detail_page.dart';

class ViewProjectDetailPage extends StatelessWidget {
  final String bannerImage;
  final String appLogoImage;
  final String appTextName;
  final List<String> carouselImages;
  final List<String> tags;
  final String appDesc;
    final String playStoreLink;
  final String appStoreLink;
  final String buymeaCoffeeLink;
  final String organizationImage;
  final ThemeController themeController = Get.put(ThemeController());
  final ScrollController _scrollController = ScrollController();

  ViewProjectDetailPage(
      {super.key,
      required this.bannerImage,
      required this.appLogoImage,
      required this.appTextName,
      required this.carouselImages,
      required this.appDesc,
      required this.organizationImage,
      required this.tags, required this.playStoreLink, required this.appStoreLink, required this.buymeaCoffeeLink});

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
                  DetailPage(
                    bannerImage: bannerImage,
                    appLogoImage: appLogoImage,
                    appTextName: appTextName,
                    carouselImages: carouselImages,
                    appDesc: appDesc,
                    organizationImage: organizationImage,
                    tags: tags,
                    playStoreLink: playStoreLink,
                    appStoreLink: appStoreLink,
                    buymeaCoffeeLink: buymeaCoffeeLink,
                  ),
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
