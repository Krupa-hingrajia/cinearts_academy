import 'dart:convert';
import 'package:cinearts_academy_app/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Internet/check_network.dart';
import 'package:cinearts_academy_app/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:cinearts_academy_app/UI/Screens/OnBoardingSection/Widget/image_picker_class.dart';
import 'package:cinearts_academy_app/UI/Screens/OnBoardingSection/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrScanScreen extends GetView<OnBoardingController> {
  QrScanScreen({Key? key}) : super(key: key);
  final OnBoardingController con = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: (OnBoardingController controller) {
          return MediaQuery(
            data: data.copyWith(textScaleFactor: 1),
            child: CheckNetwork(
              child: Scaffold(
                backgroundColor: ColorConstants.bgColor,
                body: SizedBox(
                  width: displayWidth(context),
                  height: displayHeight(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Image.asset(
                        ImageConstants.appLogo,
                        width: displayWidth(context) * .43,
                      ),

                      Column(
                        children: [
                          Text(
                            AppConstants.setupYourAccount.tr,
                            style: TextStylePoppinsExtraBold20(
                                color: ColorConstants.white),
                          ),
                          SizedBox(
                            height: displayHeight(context) * .018,
                          ),
                          /// Id Card
                          GestureDetector(
                            onTap: controller.matchedStudent.isEmpty
                                ? () async {
                              await pickImage(source: ImageSource.camera)
                                  .then((value) async {
                                if (value != '') {
                                  final InputImage inputImage =
                                      InputImage.fromFilePath(value);
                                  controller.processImage(inputImage);
                                } else {}
                              });
                            }:(){},
                            child: Container(
                              height: controller.matchedStudent.isEmpty ?displayHeight(context) * .240:null,
                              width: displayWidth(context) * .89,
                              padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * .063),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                    colors: ColorConstants.idCardBG),
                              ),
                              alignment: Alignment.center,
                              child: controller.matchedStudent.isNotEmpty
                                  ? Padding(
                                    padding: EdgeInsets.only(bottom:displayHeight(context) * .02),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          /// CArd Logo
                                          Center(
                                            child: Padding(
                                              padding:  EdgeInsets.only(top: displayHeight(context) * .093),
                                              child: SizedBox(
                                                height: displayHeight(context) * .03,
                                                width: displayWidth(context) * .213,
                                                child: Image.asset(
                                                  ImageConstants.appLogo,
                                                ),
                                              ),
                                            ),
                                          ),
                                          /// Student Id & Card EXP Date
                                          Padding(
                                            padding: EdgeInsets.only(top: displayHeight(context) * .029,),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    /// Student Id
                                                    Text(
                                                      controller.matchedStudent
                                                          .first.studentId
                                                          .toString(),
                                                      style:  TextStyleCourierPrime(size: 16,fontWeight: FontWeight.w700),
                                                    ),

                                                    /// Student Course
                                                    Text(
                                                      controller.matchedStudent
                                                          .first.studentCourse
                                                          .toString(),
                                                      style: TextStyleCourierPrime(size: 7,fontWeight: FontWeight.w400),
                                                    )
                                                  ],
                                                ),

                                                /// Card Exp Date
                                                Column(
                                                  children: [
                                                     Text(
                                                      AppConstants.expDate.tr,
                                                      style: TextStyleCourierPrime(size: 7,fontWeight: FontWeight.w700),
                                                    ),
                                                    Text(
                                                      controller.matchedStudent
                                                          .first.cardExpDate
                                                          .toString(),
                                                      style:  TextStyleCourierPrime(size: 10,fontWeight: FontWeight.w700),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          /// Student Name
                                          Padding(
                                            padding: EdgeInsets.only(top: displayHeight(context)*.0058),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                controller.matchedStudent.first
                                                    .studentName
                                                    .toString(),
                                                style:  TextStyleCourierPrime(size: 14,fontWeight: FontWeight.w700),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                  )
                                  : Container(
                                alignment: Alignment.center,padding: const EdgeInsets.all(6),
                                      child: Text(
                                        AppConstants.addStudentIDCard.tr,
                                        textAlign: TextAlign.center,
                                        style: TextStylePoppinsMedium14(
                                            color: ColorConstants.white),
                                      ),
                                    ),
                            ),
                          ),

                          SizedBox(
                            height: displayHeight(context) * .01,
                          ),
                          if(controller.matchedStudent.isEmpty)
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: displayWidth(context) * .048),
                            child: Text(
                              AppConstants.makeSureText.tr,
                              //"Make sure that all four corners of the card are visible and that there are no obstructions or glare.",
                              textAlign: TextAlign.center,
                              style: TextStylePoppinsRegular10(
                                  color: ColorConstants.white
                              ),
                            ),
                          ),
                        ],
                      ),

                      if (controller.progress.value)
                        const CircularProgressIndicator(
                          color: ColorConstants.primary,
                        ),

                      /// Proceed Button
                      IgnorePointer(
                        ignoring:
                            controller.matchedStudent.isNotEmpty ? false : true,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                SharedPreferences shr =
                                    await SharedPreferences.getInstance();
                                shr.setString('studentData',
                                    jsonEncode(controller.matchedStudent.first));
                                shr.setBool('OnBoard', true);
                                Get.offAllNamed(RoutesConstants.homeScreen);
                              },
                              child: Container(
                                height: displayHeight(context) * .06,
                                width: displayWidth(context) * .5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  color: controller.matchedStudent.isNotEmpty
                                      ? ColorConstants.primary
                                      : ColorConstants.primary.withOpacity(.6),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  AppConstants.proceed.tr,
                                  style: TextStylePoppinsExtraBold20(
                                      color: controller.matchedStudent.isNotEmpty
                                          ? ColorConstants.white
                                          : ColorConstants.white.withOpacity(.8)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: displayWidth(context) * .033,
                            ),
                            GestureDetector(
                              onTap: () async {
                                SharedPreferences shr =
                                    await SharedPreferences.getInstance();
                                shr.setString('studentData',
                                    jsonEncode(controller.matchedStudent.first));
                                shr.setBool('OnBoard', true);
                                Get.offAllNamed(RoutesConstants.homeScreen);
                              },
                              child: Container(
                                height: displayHeight(context) * .068,
                                width: displayWidth(context) * .14,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.matchedStudent.isNotEmpty
                                      ? ColorConstants.primary
                                      : ColorConstants.primary.withOpacity(.6),
                                ),
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: controller.matchedStudent.isNotEmpty
                                      ? ColorConstants.white
                                      : ColorConstants.white.withOpacity(.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
