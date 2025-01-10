import 'package:amanportfolio/Widgets/floatingActionButton.dart';
import 'package:amanportfolio/Widgets/HomeWidgets/fiveSection/five_section.dart';
import 'package:amanportfolio/Widgets/navigation_bar.dart';
import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../Controller/theme_controller.dart';
import '../Widgets/HomeWidgets/FirstSection/first_section.dart';
import '../Widgets/HomeWidgets/FourthSection/fourth_section.dart';
import '../Widgets/HomeWidgets/SecondSection/second_section.dart';
import '../Widgets/HomeWidgets/ThirdSection/third_section.dart';

class HomeScreen extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  final ScrollController _scrollController = ScrollController();

  HomeScreen({super.key});

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
                  FirstSection(),
                  const SecondSection(),
                  ThirdSection(),
                  FourthSection(),
                  FiveSection(),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: floatingActionsbutton(scrollController: _scrollController),
      ),
    );
  }
}