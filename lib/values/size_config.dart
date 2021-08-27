import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeigh;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeigh = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

double getPropotionateScreenHeight(double inputHeight) {
  double height = SizeConfig.screenHeigh;
  return (inputHeight / 812.0) * height;
}

double getProportionateScreenWidth(double inputWidth) {
  double width = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * width;
}
