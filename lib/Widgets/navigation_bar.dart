import 'package:amanportfolio/Widgets/custom_confetti.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/Navigation_controller.dart';
import '../Controller/theme_controller.dart';
import '../utils/Colors/custom_colors.dart';

class CustomNavigationBar extends StatelessWidget {
  final ConfettiController confettiController = Get.put(ConfettiController());
  final NavigationController navigationController =
      Get.put(NavigationController());

  CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
              _buildNavItem("Home",
                  isActive: navigationController.activeTab.value == 'Home'),
              _buildNavItem("About",
                  isActive: navigationController.activeTab.value == 'About'),
              _buildNavItem("Resume",
                  isActive: navigationController.activeTab.value == 'Resume'),
              _buildIconNavItem(),
              _buildNavItem("Portfolio",
                  isActive:
                      navigationController.activeTab.value == 'Portfolio'),
              _buildNavItem("Contact",
                  isActive: navigationController.activeTab.value == 'Contact'),
              buildSwitchButton(),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CustomConfettiWidget(
            confettiController: confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 20,
            colors: const [
              Colors.red,
              Colors.green,
              Colors.blue,
              Colors.orange,
              Colors.purple,
            ],
            gravity: 0.3,
            maxBlastForce: 30,
            minBlastForce: 10,
            shouldLoop: false,
          ),
        ),
      ],
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
  final NavigationController navigationController =
      Get.put(NavigationController());
  MobileNavigationDrawer({super.key});

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
            _buildNavItem("Home",
                isActive: navigationController.activeTab.value == 'Home'),
            const SizedBox(height: 20.0),
            _buildNavItem("About", isActive: navigationController.activeTab.value == 'About'),
            const SizedBox(height: 20.0),
            _buildNavItem("Resume", isActive: navigationController.activeTab.value == 'Resume'),
            const SizedBox(height: 20.0),
            _buildNavItem("Portfolio", isActive: navigationController.activeTab.value == 'Portfolio'),
            const SizedBox(height: 20.0),
            _buildNavItem("Contact", isActive: navigationController.activeTab.value == 'Contact'),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildSwitchButton(),
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
  final NavigationController navigationController =
      Get.find<NavigationController>();
  return GestureDetector(
    onTap: () {
      navigationController.updateActiveTabAndNavigate(title);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: isActive ? ColorResources.whiteColor : Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        title,
        style: GoogleFonts.ubuntu(
          color: isActive ? ColorResources.greyOneColor : Colors.white,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ),
  );
}

Widget buildSwitchButton() {
  final ConfettiController confettiController = Get.put(ConfettiController());
  final ThemeController themeController = Get.put(ThemeController());

  return Obx(() {
    return Switch(
      value: themeController.isDarkMode.value,
      onChanged: (value) {
        themeController.toggleTheme();
        confettiController.play();
        Future.delayed(const Duration(seconds: 1), () {
          confettiController.stop();
        });
      },
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
