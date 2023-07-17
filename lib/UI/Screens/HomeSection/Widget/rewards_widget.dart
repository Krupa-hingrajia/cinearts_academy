import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinearts_academy_app/Infrastructure/Base/MediaQuery/get_mediaquery.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardsWidget extends StatelessWidget {
  const RewardsWidget({Key? key, this.onTap, this.link}) : super(key: key);
  final GestureTapCallback? onTap;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: displayWidth(context) * .165,
        width: displayWidth(context) * .165,
        margin: EdgeInsets.only(top: Get.height * .011, right: Get.width * .05),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CachedNetworkImage(
              imageUrl: link!,
              errorWidget: (context, uri, error) {
                return const Icon(
                  Icons.wifi_off,
                  color: ColorConstants.primary,
                );
              },
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const Center(
                  child: Icon(
                Icons.signal_wifi_statusbar_connected_no_internet_4,
                color: ColorConstants.primary,
              )),
            ),

            ),
      ),
    );
  }
}
