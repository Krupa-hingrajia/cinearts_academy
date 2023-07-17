import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutConstants {

  //sizedBox
  static SizedBox standardSpacingVertical =  SizedBox(
    height: Get.height*.018,
  );
  static SizedBox standardSpacingVertical8 =  SizedBox(
    height: Get.height*.0093,
  );
  static SizedBox standardSpacingVertical32 =  SizedBox(
    height: Get.height*.037,
  );
  static Container dividerVertical = Container(
    color: Colors.black.withOpacity(0.9),
    width: 1,
    height: 90,
  );
}

EdgeInsets standardPadding(
    {required double screenHeight, required double screenWidth}) {
  double horizontalPadding = screenWidth * .05333;
  double verticalPadding = screenHeight * .02463;
  return EdgeInsets.only(
    left: horizontalPadding,
    right: horizontalPadding,
    top: verticalPadding,
    bottom: verticalPadding,
  );
}

EdgeInsets horizontalPadding({required double screenWidth}) {
  double horizontalPadding = screenWidth * .05333;
  return EdgeInsets.only(
    left: horizontalPadding,
    right: horizontalPadding,
  );
}

EdgeInsets verticalPadding({required double screenHeight}) {
  double verticalPadding = screenHeight * .02463;
  return EdgeInsets.only(
    top: verticalPadding,
    bottom: verticalPadding,
  );
}
