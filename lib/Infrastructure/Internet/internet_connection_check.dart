// ignore_for_file: library_private_types_in_public_api

import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InternetConnectionCheck extends StatefulWidget {
  const InternetConnectionCheck({
    Key? key,
  }) : super(key: key);

  @override
  _InternetConnectionCheckState createState() => _InternetConnectionCheckState();
}

class _InternetConnectionCheckState extends State<InternetConnectionCheck> {
//Show dialog if user not connected to an check_network
  _showDialog({
    text,
    context,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(text),
            actions: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InternetConnectionCheck(),
                        ));
                  },
                  child: GestureDetector(
                      onTap: () async {
                        var result = await Connectivity().checkConnectivity();
                        if (result == ConnectivityResult.none) {
                          Get.snackbar('', AppConstants.notInNetwork.tr);
                        } else {
                          Get.snackbar('', AppConstants.inNetwork.tr);
                        }
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          AppConstants.okay.tr,
                        ),
                      )))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset('assets/images/smiley.png',
                  cacheHeight: 64, cacheWidth: 64),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(AppConstants.noInternet.tr,
                        style: const TextStyle(
                            fontSize: 20, color: ColorConstants.black)),
                    const SizedBox(height: 5),
                    GestureDetector(
                        onTap: () async {
                          var result = await Connectivity().checkConnectivity();
                          if (result == ConnectivityResult.none) {
                            // ignore: use_build_context_synchronously
                            return _showDialog(
                              context: context,
                              text: AppConstants.lostConnection.tr,
                            );
                          } else {
                            Get.snackbar('', AppConstants.notConnected.tr);
                          }
                        },
                        child: Text(AppConstants.refresh.tr,
                            style: const TextStyle(
                                fontSize: 16,
                                color: ColorConstants.primary,
                                decoration: TextDecoration.underline))),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
