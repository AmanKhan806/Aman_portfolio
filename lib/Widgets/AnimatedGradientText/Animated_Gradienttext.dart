import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller/Animated_Controller.dart';
import '../../utils/Colors/custom_colors.dart';

class AnimatedGradientText extends StatelessWidget {
  final String text;
  final double fontSize;

  AnimatedGradientText({
    Key? key,
    required this.text,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AnimatedGradientController gradientController =
        Get.put(AnimatedGradientController()); // Get the controller

    return AnimatedBuilder(
      animation: gradientController.animationController,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                gradientController.color1Animation.value ??
                    ColorResources.appMainColor,
                gradientController.color2Animation.value ?? Colors.cyan,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
          },
          child: Text(
            text,
            style: GoogleFonts.ubuntu(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
