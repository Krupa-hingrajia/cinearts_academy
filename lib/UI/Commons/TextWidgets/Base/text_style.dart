// ignore_for_file: non_constant_identifier_names, unused_local_variable
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/font_constants.dart';
import 'package:flutter/material.dart';

/// -----------> Poppins
TextStyle TextStylePoppinsRegular8({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 8,
    fontFamily: FontConstant.poppinsRegular,
  );
}
TextStyle TextStylePoppinsRegular10({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 10,
    fontFamily: FontConstant.poppinsRegular,
  );
}
TextStyle TextStylePoppinsRegular12({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 12,
    fontFamily: FontConstant.poppinsRegular,
  );
}
TextStyle TextStylePoppinsRegular13({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 13,
    fontFamily: FontConstant.poppinsRegular,
  );
}

TextStyle TextStylePoppinsMedium14({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 =  TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 14,
    fontFamily: FontConstant.poppinsMedium,
  );
}
TextStyle TextStylePoppinsMedium16({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 =  TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 16,
    fontFamily: FontConstant.poppinsMedium,
  );
}

TextStyle TextStylePoppinsBold12({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 12,
    fontFamily: FontConstant.poppinsSemiBold,
  );
}
TextStyle TextStylePoppinsBold14({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 14,
    fontFamily: FontConstant.poppinsSemiBold,
  );
}
TextStyle TextStylePoppinsBold20({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 20,
    fontFamily: FontConstant.poppinsSemiBold,
  );
}

TextStyle TextStylePoppinsExtraBold18({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 18,
    fontFamily: FontConstant.poppinsExtraBold,
  );
}
TextStyle TextStylePoppinsExtraBold20({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 20,
    fontFamily: FontConstant.poppinsExtraBold,
  );
}
TextStyle TextStylePoppinsExtraBold30({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 30,
    fontFamily: FontConstant.poppinsExtraBold,
  );
}
TextStyle TextStylePoppinsBlack25({Color? color}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? ColorConstants.textColor,
    fontSize: 25,
    fontFamily: FontConstant.poppinsBlack,
  );
}

/// ----------
///
TextStyle TextStyleCourierPrime({Color? color,double? size,FontWeight? fontWeight}) {
  TextStyle textStyle1;
  return textStyle1 = TextStyle(
    color: color ?? Colors.white,
    fontSize: size ?? 12,
    fontFamily: FontConstant.courierPrime,
      fontWeight: fontWeight ?? FontWeight.normal
  );
}