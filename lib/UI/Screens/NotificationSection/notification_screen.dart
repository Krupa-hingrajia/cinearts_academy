// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_full_hex_values_for_flutter_colors, curly_braces_in_flow_control_structures, unrelated_type_equality_checks, must_be_immutable

import 'package:cinearts_academy_app/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Utils/Extensions/history_time_extension.dart';
import 'package:cinearts_academy_app/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:cinearts_academy_app/UI/Screens/NotificationSection/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends GetView<NotificationController> {
  NotificationScreen({Key? key}) : super(key: key);
  @override
  NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    final MediaQueryData data = MediaQuery.of(context);
    return GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) {
          return MediaQuery(
            data: data.copyWith(textScaleFactor: 1),
            child: Scaffold(
              appBar: AppBar(
                leading: BackButton(
                  color: ColorConstants.transparent,
                  onPressed: null,
                ),
                backgroundColor: ColorConstants.transparent,
                elevation: 0,
              ),
              backgroundColor: ColorConstants.bgColor,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: displayWidth(context)*.06),
                child: Column(
                  children: [
                    /// Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            Get.delete();
                          },
                          child: Container(
                            height: displayHeight(context)*.068,
                            width: displayWidth(context)*.14,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorConstants.primary,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: ColorConstants.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: displayWidth(context) * .033,
                        ),
                        Container(
                          height: displayHeight(context)*.061,
                          width: displayWidth(context)*.51,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: ColorConstants.primary,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            AppConstants.notifications.tr,
                            style: TextStylePoppinsExtraBold18(
                                color: ColorConstants.white),
                          ),
                        ),
                      ],
                    ),
                    /// Empty Screen
                    if(controller.notifications == null || controller.notifications.isEmpty)
                      Center(
                        child: Padding(
                          padding:  EdgeInsets.only(top: displayHeight(context)*.29),
                          child: Text(AppConstants.noNotificationsFound.tr,textAlign: TextAlign.center,style: TextStylePoppinsMedium16(color: ColorConstants.white),),
                        ),
                      ),
                    /// Notifications
                    if(controller.notifications != null && controller.notifications.isNotEmpty)
                    Expanded(
                      child: RefreshIndicator(
                        color: ColorConstants.primary,
                        onRefresh: () async {
                          controller.getNotification();
                          controller.reversedData =
                              controller.notifications.reversed.toList();
                          controller.update();
                        },
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: displayHeight(context)*.035),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.notifications != null
                              ? controller.notifications.length
                              : 0,
                          itemBuilder: (BuildContext context, int index) {
                            controller.reversedData =
                                controller.notifications.reversed.toList();
                            return Column(
                              children: [
                                if (index == 0)
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      historyWatchAgoCustom(
                                        controller.reversedData,
                                        index: index,
                                      ),
                                      style: historyWatchAgoCustom(
                                                controller.reversedData,
                                                index: index,
                                              ) !=
                                              ''
                                          ? TextStylePoppinsBold14(
                                              color: ColorConstants.white)
                                          : null,
                                    ),
                                  ),
                                if (index != 0)
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: historyWatchAgoCustom(
                                              controller.reversedData,
                                              index: index,
                                            ) !=
                                            historyWatchAgoCustom(
                                              controller.reversedData,
                                              index: (index - 1),
                                            )
                                        ? Text(
                                            historyWatchAgoCustom(
                                              controller.reversedData,
                                              index: index,
                                            ),
                                            style: historyWatchAgoCustom(
                                                      controller.reversedData,
                                                      index: index,
                                                    ) !=
                                                    ''
                                                ? TextStylePoppinsBold14(
                                                    color: ColorConstants.white)
                                                : null,
                                          )
                                        : Container(),
                                  ),
                                if (!historyTimeAgoCustom(d: DateTime.parse(controller.reversedData[index]['time'])).contains('Day'))
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.symmetric(vertical: displayHeight(context)*.0211),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: ColorConstants.primary,
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          ImageConstants.notificationBell,
                                          height: displayHeight(context)*.053,
                                        ),

                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 6.0),
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    controller.reversedData[index]
                                                        ['notification'],
                                                    //overflow: TextOverflow.ellipsis,
                                                    style: TextStylePoppinsBold14(
                                                        color:
                                                            ColorConstants.white),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: FittedBox(
                                                    child: Container(padding: EdgeInsets.symmetric(horizontal: 6),
                                                      height: displayHeight(context)*.0211,
                                                     // width: displayWidth(context)*.24,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              ColorConstants.bgColor,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10)),
                                                      alignment: Alignment.center,
                                                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .access_time_filled_sharp,
                                                            size: 16,
                                                            color:
                                                                ColorConstants.white,
                                                          ),
                                                          Padding(padding: const EdgeInsets.only(left: 4.0), child: Text(historyTimeAgoCustom(d: DateTime.parse(controller.reversedData[index]['time'])), style: TextStylePoppinsRegular8(color: ColorConstants.white),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (historyTimeAgoCustom(d: DateTime.parse(controller
                                            .reversedData[index]['time'])).contains('Day'))
                                  Container(
                                    padding: EdgeInsets.all(15),
                                    margin: EdgeInsets.symmetric(vertical: displayHeight(context)*.0211),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: ColorConstants.notificationBG,
                                    ),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          ImageConstants.notificationBell,
                                          height: displayHeight(context)*.053,
                                        ),
                                        Expanded(
                                          child: Text(
                                            controller.reversedData[index]
                                                ['notification'],
                                            //overflow: TextOverflow.ellipsis,
                                            style: TextStylePoppinsBold14(
                                                color: ColorConstants.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
