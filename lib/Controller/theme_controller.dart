import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController {
  var isDarkMode = true.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  Color get textColor =>
      isDarkMode.value ? ColorResources.whiteColor : ColorResources.blackColor;
  Color get containerColor => isDarkMode.value
      ? ColorResources.containerBlackColor
      : ColorResources.backgroundColor1;

  Color get glassEffectColor =>
      isDarkMode.value ? Colors.grey.shade800 : Colors.white70;

  Color get logotextColor =>
      isDarkMode.value ? ColorResources.blackColor : ColorResources.whiteColor;
}

class ThirdPageController extends GetxController {
  var isHovered = false.obs;

  void setHover(bool value) {
    isHovered.value = value;
  }
}
