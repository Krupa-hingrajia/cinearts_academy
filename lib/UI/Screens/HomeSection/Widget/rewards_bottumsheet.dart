import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinearts_academy_app/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/layout_constants.dart';
import 'package:cinearts_academy_app/UI/Commons/TextWidgets/Base/text_style.dart';
import 'package:cinearts_academy_app/UI/Screens/HomeSection/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future rewardsBottomSheet({
  required String rewardName,
  required String rewardDescription,
  required String link,
  required String rewardImage,
  required String rewardDiscountText,
  BuildContext? context,
  String? imgPath,
  String? mediaType,
}) async =>
    showModalBottomSheet(
        backgroundColor: ColorConstants.transparent,
        context: context!,
        isScrollControlled: true,
        // barrierColor: Colors.black.withOpacity(.5),
        builder: (context) {
          return BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
              tileMode: TileMode.mirror,
            ),
            child: GetBuilder<HomeController>(builder: (controller) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(41),
                    topLeft: Radius.circular(41)),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: displayWidth(context) * .06),
                  color: ColorConstants.primary,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: displayHeight(context) * .008,
                            width: displayWidth(context) * .24,
                            margin: const EdgeInsets.only(top: 25, bottom: 37),
                            decoration: BoxDecoration(
                                color: ColorConstants.white,
                                borderRadius: BorderRadius.circular(50)),
                          ),
                        ),
                        Text(
                          rewardName,
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStylePoppinsExtraBold30(
                              color: ColorConstants.white),
                        ),
                        SizedBox(
                          height: displayHeight(context) * .023,
                        ),
                        Text(
                          rewardDescription,
                          textAlign: TextAlign.start,
                          style: TextStylePoppinsRegular13(
                              color: ColorConstants.white),
                        ),
                        SizedBox(
                          height: displayHeight(context) * .041,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              child: Container(
                                height: displayHeight(context) * .089,
                                width: displayWidth(context) * .59,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: ColorConstants.white,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  rewardDiscountText.toString(),
                                  style: TextStylePoppinsBold20(),
                                ),
                              ),
                            ),
                            Container(
                              height: displayHeight(context) * .089,
                              width: displayWidth(context) * .19,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: ColorConstants.white,
                              ),
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  imageUrl: rewardImage,
                                  errorWidget: (context, uri, error) {
                                    return const Icon(
                                      Icons.wifi_off,
                                      color: ColorConstants.primary,
                                    );
                                  },
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(
                                      child: Icon(
                                    Icons
                                        .signal_wifi_statusbar_connected_no_internet_4,
                                    color: ColorConstants.primary,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        LayoutConstants.standardSpacingVertical,
                        Center(
                          child: Container(
                              width: displayWidth(context) * .82,
                              height: displayHeight(context) * .036,
                              decoration: BoxDecoration(
                                  color: ColorConstants.white,
                                  borderRadius: BorderRadius.circular(22)),
                              alignment: Alignment.center,
                              //padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * .015),
                              child: Text(
                                link,
                                style: TextStylePoppinsBold12(),
                              )),
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
