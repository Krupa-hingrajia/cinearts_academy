import 'package:cinearts_academy_app/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/layout_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Internet/check_network.dart';
import 'package:cinearts_academy_app/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:cinearts_academy_app/UI/Screens/HomeSection/Widget/key_bottumsheet.dart';
import 'package:cinearts_academy_app/UI/Screens/HomeSection/Widget/rewards_bottumsheet.dart';
import 'package:cinearts_academy_app/UI/Screens/HomeSection/Widget/rewards_widget.dart';
import 'package:cinearts_academy_app/UI/Screens/HomeSection/Widget/top_bar_widget.dart';
import 'package:cinearts_academy_app/UI/Screens/HomeSection/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => MediaQuery(
      data: data.copyWith(textScaleFactor: 1),
        child: Scaffold(
          backgroundColor: ColorConstants.bgColor,
          body: CheckNetwork(
            child: SizedBox(
              height: displayHeight(context),
              width: displayWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  /// Top Tabs
                  Container(
                    margin: EdgeInsets.only(
                      top: displayHeight(context) * .095,
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: displayWidth(context) * .063),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Zoom
                        TopBarWidget(
                          onTap: () async =>
                              await launchUrl(Uri.parse(controller.zoomLink)),
                          backgroundColor: ColorConstants.zoomBg,
                          image: ImageConstants.zoomIcon,
                        ),

                        /// Whatsapp
                        TopBarWidget(
                          onTap: () async =>
                              await launchUrl(Uri.parse(controller.whatsappLink)),
                          backgroundColor: ColorConstants.whatsappBg,
                          image: ImageConstants.whatsappIcon,
                        ),

                        /// Slack
                        TopBarWidget(
                          onTap: () async =>
                              await launchUrl(Uri.parse(controller.slackLink)),
                          backgroundColor: ColorConstants.slackBg,
                          image: ImageConstants.clackIcon,
                        ),

                        /// Key
                        TopBarWidget(
                          onTap: () async => keyBottomSheet(
                            keyValue: controller.keyValue.value,
                            context: context, //
                          ),
                          backgroundColor: ColorConstants.keyBg,
                          image: ImageConstants.keyIconWhite,
                        ),

                        /// Notification
                        TopBarWidget(
                          onTap: () =>
                              Get.toNamed(RoutesConstants.notificationScreen),
                          backgroundColor: ColorConstants.notificationBg,
                          image: ImageConstants.bell,
                        ),
                      ],
                    ),
                  ),

                  /// ID Card
                  Container(
                      margin: EdgeInsets.only(top: displayHeight(context) * .053),
                      padding: EdgeInsets.symmetric(
                          horizontal: displayWidth(context) * .063,//vertical: displayHeight(context) * .007,
                          ),
                      // height: displayHeight(context) * .241,
                      width: displayWidth(context) * .89,
                      decoration: BoxDecoration(
                          gradient:
                              LinearGradient(colors: ColorConstants.idCardBG),
                          borderRadius: BorderRadius.circular(30)),
                      child: controller.studentData != null ?
                          Padding(
                            padding: EdgeInsets.only(bottom:displayHeight(context) * .02),
                            child: Column(
                        children: [
                            Padding(
                              padding: EdgeInsets.only(top: displayHeight(context) * .093
                              ),
                              child: SizedBox(
                                height: displayHeight(context) * .03,
                                width: displayWidth(context) * .213,
                                child: Image.asset(
                                  ImageConstants.appLogo,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: displayHeight(context) * .029,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.studentData['studentID'].toString(),
                                        style: TextStyleCourierPrime(size: 16,fontWeight: FontWeight.w700),
                                      ),
                                      Text(controller.studentData['studentCourse'].toString(),
                                        style: TextStyleCourierPrime(size: 7,fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                       Text(
                                        AppConstants.expDate.tr,
                                        style: TextStyleCourierPrime(size: 7,fontWeight: FontWeight.w700),
                                      ),
                                      Text(controller.studentData['cardExpDate'].toString(),
                                        style: TextStyleCourierPrime(size: 10,fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: displayHeight(context) * .0058),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  controller.studentData['studentName'].toString(),
                                  style: TextStyleCourierPrime(size: 14,fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                        ],
                      ),
                          )
                     : Container(),
                      ),

                  /// Renew Card & request Card
                  Padding(
                    padding: EdgeInsets.only(
                        top: 12,
                        left: displayWidth(context) * .050,
                        right: displayWidth(context) * .050),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => launchUrl(Uri.parse(
                              'https://www.cineartsacademy.com/renew-card')),
                          child: Container(
                            height: displayHeight(context) * .064,
                            width: displayWidth(context) * .435,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            alignment: Alignment.center,
                            child: Text(
                              AppConstants.renewCard.tr,
                              textAlign: TextAlign.center,
                              style: TextStylePoppinsBold12(),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => launchUrl(Uri.parse(
                              'https://www.cineartsacademy.com/request-card')),
                          child: Container(
                            height: displayHeight(context) * .064,
                            width: displayWidth(context) * .435,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white),
                            alignment: Alignment.center,
                            child: Text(
                              AppConstants.requestNewCard.tr,
                              textAlign: TextAlign.center,
                              style: TextStylePoppinsBold12(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  /// Reward Text
                  Padding(
                    padding: EdgeInsets.only(
                        top: displayHeight(context) * .041,
                        left: displayWidth(context) * .050),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(AppConstants.rewards.tr,
                          style: TextStylePoppinsExtraBold30(
                              color: ColorConstants.white)),
                    ),
                  ),

                  /// Reward Cards
                  Container(
                    padding:
                        horizontalPadding(screenWidth: displayWidth(context)),
                    height: displayHeight(context) * .34,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: controller.getRewardsData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Container();
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          /// ConnectionState Waiting
                          return Container();
                        } else if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.data!.docs.isNotEmpty) {
                            final data = snapshot.data!.docs;

                            /// Create Chunks
                            List<List<QueryDocumentSnapshot<Object?>>>
                                chunkedData = data.chunked(7).toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: (chunkedData.length),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  width: displayWidth(context),
                                  height: 75,
                                  child: ListView.builder(
                                    itemCount: (chunkedData[index].length),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int chunkIndex) {
                                      var data = chunkedData[index];
                                      return RewardsWidget(
                                        link: data[chunkIndex]['rewardLogo'],
                                        onTap: () => rewardsBottomSheet(
                                            context: context,
                                            rewardName: data[chunkIndex]
                                                ['rewardName'],
                                            rewardDescription: data[chunkIndex]
                                                ['rewardDescription'],
                                            rewardDiscountText: data[chunkIndex]
                                                ['rewardDiscountText'],
                                            link: data[chunkIndex]['rewardLink'],
                                            rewardImage: data[chunkIndex]
                                                ['rewardLogo']),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          } else {
                            /// On Empty
                            return Container();
                          }
                        } else {
                          /// ConnectionState Lost
                          return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
