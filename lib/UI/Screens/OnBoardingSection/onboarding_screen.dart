// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_full_hex_values_for_flutter_colors, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, must_be_immutable

import 'package:cinearts_academy_app/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:cinearts_academy_app/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:cinearts_academy_app/UI/Screens/OnBoardingSection/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends GetView<OnBoardingController> {
  OnBoardingScreen({Key? key}) : super(key: key);
  @override
  OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: (controller) {
          return MediaQuery(
            data: data.copyWith(textScaleFactor: 1),
              child: Scaffold(
                backgroundColor: ColorConstants.bgColor,
                body: Container(
                  width: displayWidth(context),
                  height: displayHeight(context),
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: displayHeight(context) * .09),
                        child: Image.asset(
                          ImageConstants.appLogo,
                          width: displayWidth(context) * .43,
                        ),
                      ),
                      Expanded(
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: controller.introController.value,
                          itemCount: controller.onBoardingImage.length,
                          onPageChanged: (index) {
                            controller.initialIndex.value = index;
                            controller.update();
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayHeight(context) * .05),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    controller.onBoardingImage[index],
                                    height: displayHeight(context) * .29,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: displayHeight(context) * .09),
                                    child: Text(
                                      controller.onBoardingTitles[index],
                                      textAlign: TextAlign.center,
                                      style: TextStylePoppinsBlack25(
                                          color: Colors.white),
                                    ),
                                  ),
                                  Text(
                                    controller.onBoardingSubTitles[index],
                                    textAlign: TextAlign.center,
                                    style: TextStylePoppinsRegular12(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: displayHeight(context) * .07),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (controller.initialIndex.value != 0 &&
                                controller.initialIndex.value != 3)
                              GestureDetector(
                                onTap: () => controller.previousScreen(),
                                child: Container(
                                  height: displayHeight(context) * .068,
                                  width: displayWidth(context) * .14,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorConstants.primary,
                                  ),
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    color: ColorConstants.white,
                                  ),
                                ),
                              ),
                            if (controller.initialIndex.value != 0)
                              SizedBox(
                                width: displayWidth(context) * .033,
                              ),
                            GestureDetector(
                              onTap: () => controller.initialIndex.value == 3
                                  ? Get.toNamed(RoutesConstants.qrScanScreen)
                                  : controller.nextScreen(),
                              child: Container(
                                height: displayHeight(context) * .06,
                                width: displayWidth(context) * .516,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  color: ColorConstants.primary,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  controller.initialIndex.value == 3
                                      ? AppConstants.letsStart.tr
                                      : AppConstants.next.tr,
                                  style: TextStylePoppinsExtraBold20(
                                      color: ColorConstants.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
