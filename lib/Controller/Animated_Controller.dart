import 'package:amanportfolio/Controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../utils/Colors/custom_colors.dart';

class AnimatedGradientController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ThemeController themeController = Get.find<ThemeController>();

  late AnimationController animationController;
  late Animation<Color?> color1Animation;
  late Animation<Color?> color2Animation;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    updateGradientColors();
    ever(themeController.isDarkMode, (_) => updateGradientColors());
  }

  void updateGradientColors() {
    color1Animation = ColorTween(
      begin: themeController.isDarkMode.value
          ? Colors.deepOrange
          : ColorResources.appMainColor,
      end: themeController.isDarkMode.value ? Colors.white : ColorResources.backgroundColor1,
    ).animate(animationController);

    color2Animation = ColorTween(
      begin: themeController.isDarkMode.value
          ? Colors.redAccent
          : ColorResources.appMainColor,
      end: themeController.isDarkMode.value
          ? Colors.blueGrey
          : Colors.blueAccent,
    ).animate(animationController);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

