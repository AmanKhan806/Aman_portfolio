import 'package:amanportfolio/Controller/url_launcher_function.dart';
import 'package:amanportfolio/Widgets/url_text.dart';
import 'package:amanportfolio/utils/Colors/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class floatingActionsbutton extends StatelessWidget {
  const floatingActionsbutton({
    super.key,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 70,
          right: 16,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
                mylaunchURL(whatsappUrl);
              },
              child: SvgPicture.asset(
                "assets/whatsapp.svg",
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 16,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: ColorResources.appMainColor,
              onPressed: () {
                _scrollController.animateTo(
                  0.0, 
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: const Icon(
                Icons.arrow_upward_outlined,
                color: ColorResources.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
