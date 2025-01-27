import 'package:flutter/widgets.dart';

class ResponsiveUtils {
  final BuildContext context;
  late double screenWidth;
  late double headingFontSize;
  late double textFontSize;
  late double containerPadding;
  late double sectionSpacing;
  late bool isMobile;
  late double imageWidth;
  late double avatarGlowSize;

  ResponsiveUtils(this.context) {
    screenWidth = MediaQuery.of(context).size.width;
    headingFontSize = screenWidth > 600 ? 25 : 20;
    textFontSize = screenWidth > 600 ? 14 : 12;
    containerPadding = screenWidth > 600 ? 14 : 10;
    sectionSpacing = screenWidth > 600 ? 15.0 : 10.0;
    isMobile = screenWidth < 600;
    imageWidth = screenWidth > 800 ? 280 : 180;
    avatarGlowSize = screenWidth > 800 ? 350 : 250;
  }
}
