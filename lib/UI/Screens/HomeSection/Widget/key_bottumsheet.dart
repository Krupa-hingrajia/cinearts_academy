import 'dart:ui';

import 'package:cinearts_academy_app/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/layout_constants.dart';
import 'package:cinearts_academy_app/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:cinearts_academy_app/UI/Screens/HomeSection/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future keyBottomSheet({
  required String keyValue,
  BuildContext? context,
  String? imgPath,
  String? mediaType,
}) async =>
    showModalBottomSheet(
        backgroundColor: ColorConstants.transparent,
        context: context!,
        isScrollControlled: true,
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX:5,
              sigmaY: 5,
              tileMode: TileMode.mirror,
            ),
            child: GetBuilder<HomeController>(builder: (controller) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(41),
                    topLeft: Radius.circular(41)),
                child: Container(
                  //height: displayHeight(context) * .3,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  color: ColorConstants.primary,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: Get.height*.008,
                            width: Get.width*.244,
                            margin: const EdgeInsets.only(top: 25, bottom: 28),
                            decoration: BoxDecoration(
                                color: ColorConstants.white,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        Text(
                          AppConstants.examKey.tr,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStylePoppinsExtraBold30(
                              color: ColorConstants.white),
                        ),
                         SizedBox(
                          height: Get.height*.008,
                        ),
                        Text(
                          AppConstants.thisKeyResetsEvery24hours.tr,
                          textAlign: TextAlign.start,
                          style: TextStylePoppinsRegular13(
                              color: ColorConstants.white),
                        ),
                         SizedBox(
                          height: Get.height*.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                height: Get.height*.089,
                                width: Get.width*.59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: ColorConstants.white,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  keyValue,
                                  style: TextStylePoppinsBold20(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: displayWidth(context) * .033,
                            ),
                            GestureDetector(
                              child: Container(
                                height: Get.height*.089,
                                width: Get.width*.19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: ColorConstants.white,
                                ),
                                alignment: Alignment.center,
                                child: Image.asset(ImageConstants.keyIconBlack,height: 23,),
                              ),
                            ),
                          ],
                        ),
                        LayoutConstants.standardSpacingVertical32,
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        });