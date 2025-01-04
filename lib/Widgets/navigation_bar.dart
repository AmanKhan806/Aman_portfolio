import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/theme_controller.dart';
import '../utils/Colors/custom_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: ColorResources.appMainColor,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem("Home", isActive: true),
          _buildNavItem("About"),
          _buildNavItem("Resume"),
          _buildIconNavItem(),
          _buildNavItem("Portfolio"),
          _buildNavItem("Contact"),
          _buildSwitchButton(),
        ],
      ),
    );
  }
}

class CustomNavigationBarforMobile extends StatelessWidget {
  const CustomNavigationBarforMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: ColorResources.appMainColor,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildIconNavItem(),
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MobileNavigationDrawer extends StatelessWidget {
  const MobileNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorResources.appMainColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0),
            _buildNavItem("Home", isActive: true),
            const SizedBox(height: 20.0),
            _buildNavItem("About"),
            const SizedBox(height: 20.0),
            _buildNavItem("Resume"),
            const SizedBox(height: 20.0),
            _buildNavItem("Portfolio"),
            const SizedBox(height: 20.0),
            _buildNavItem("Contact"),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildSwitchButton(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildIconNavItem() {
  return CircleAvatar(
    backgroundColor: ColorResources.whiteColor,
    radius: 20.0,
    child: Text("AK",
        style: GoogleFonts.ubuntu(
            fontWeight: FontWeight.bold,
            color: ColorResources.blackColor,
            fontSize: 16.0)),
  );
}

Widget _buildNavItem(String title, {bool isActive = false}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
    decoration: BoxDecoration(
      color: isActive ? ColorResources.whiteColor : Colors.transparent,
      borderRadius: BorderRadius.circular(20.0),
    ),
    child: Text(title,
        style: GoogleFonts.ubuntu(
          color: isActive ? ColorResources.greyOneColor : Colors.white,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        )),
  );
}

Widget _buildSwitchButton() {
  final ThemeController themeController = Get.put(ThemeController());
  return Obx(() {
    return Switch(
      value: themeController.isDarkMode.value,
      onChanged: (value) => themeController.toggleTheme(),
      activeColor: Colors.white,
      activeTrackColor: Colors.orange.shade300,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Colors.grey.shade400,
      thumbIcon: WidgetStateProperty.resolveWith<Icon?>(
        (states) {
          return themeController.isDarkMode.value
              ? const Icon(Icons.nights_stay,
                  color: ColorResources.appMainColor)
              : const Icon(Icons.wb_sunny, color: ColorResources.appMainColor);
        },
      ),
      trackColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          return themeController.isDarkMode.value
              ? Colors.orange.shade300
              : Colors.orange.shade300;
        },
      ),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color?>(
        (states) {
          return themeController.isDarkMode.value
              ? Colors.orange.shade700
              : Colors.orange.shade700;
        },
      ),
      trackOutlineWidth: WidgetStateProperty.resolveWith<double?>(
        (states) => themeController.isDarkMode.value ? 2.0 : 1.0,
      ),
      splashRadius: 20.0,
      hoverColor: Colors.orange.shade100,
      focusColor: Colors.orange.shade200,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      mouseCursor: SystemMouseCursors.click,
      autofocus: true,
    );
  });
}
