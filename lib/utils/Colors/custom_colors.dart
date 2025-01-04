import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorResources {
  static const appMainColor = Color(0xfff68b07);
  static const whiteColor = Color(0xffFFFFFF);
  static const blackColor = Color(0xff000000);
  static const greyOneColor = Color(0xff292929);
  static const backgroundColor = Color(0xff22212A);
  static const backgroundColor1 = Color.fromARGB(255, 248, 248, 248);
  static const containerBlackColor = Color(0xff22212A);
  static const kGradient2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(0.8, 1),
    colors: <Color>[
      Color(0xFF2F2F7E),
      Color(0xFF6A82FB),
    ],
    tileMode: TileMode.mirror,
  );

static SystemUiOverlayStyle getSystemUiOverlayStyle() {
    return const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: appMainColor,
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    );
  }

static SystemUiOverlayStyle getSystemUiOverlayStyleForAllScreen() {
    return const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: whiteColor,
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    );
  }
}
