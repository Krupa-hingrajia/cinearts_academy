import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/image_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/Models/student_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class OnBoardingController extends GetxController {
  Rx<PageController> introController = PageController().obs;

  RxInt initialIndex = 0.obs;
  RxBool progress = false.obs;
  RxBool isOnBoard = false.obs;

  RxList<StudentData> studentData = <StudentData>[].obs;
  RxList<StudentData> matchedStudent = <StudentData>[].obs;

  List onBoardingImage = [
    ImageConstants.onBoardingOne,
    ImageConstants.onBoardingLock,
    ImageConstants.onBoardingBell,
    ImageConstants.onBoardingGift,
  ];
  List onBoardingTitles = [
    AppConstants.easyAccess.tr,
    AppConstants.examKeyOnBoarding.tr,
    AppConstants.notificationsOnBoarding.tr,
    AppConstants.getRewards.tr,
  ];
  List onBoardingSubTitles = [
    AppConstants.easyAccessText.tr,
    AppConstants.examKeyOnBoardingText.tr,
    AppConstants.notificationsOnBoardingText.tr,
    AppConstants.getRewardsText.tr,
  ];

  /// next button code
  nextScreen() async {
    initialIndex.value++;
    introController.value.animateToPage(
      initialIndex.value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  /// back button code
  previousScreen() {
      initialIndex.value--;
      if (initialIndex.value == 0) {}
      introController.value.animateToPage(
        initialIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );

  }

  getStudentsData() async {
    studentData.clear();
    progress.value = true;
    update();
    await FirebaseFirestore.instance.collection('Students').get().then((value) {
      for (var item in value.docs) {
        studentData.add(StudentData(
          cardExpDate: item['cardExpDate'],
          studentCourse: item['studentCourse'],
          studentId: item['studentID'],
          studentName: item['studentName'],
        ));
      }
    });
  }

  void processImage(InputImage image) async {
    await getStudentsData();

    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    final RecognizedText recognizedText =
        await textRecognizer.processImage(image);
    matchedStudent.clear();

    String data = recognizedText.text;
    matchedStudent = RxList(studentData
        .where(
            (p0) => data.trim().toLowerCase().contains(p0.studentId.toString()))
        .toList());
    progress.value = false;
    matchedStudent.isEmpty
        ? Get.snackbar(AppConstants.error.tr, AppConstants.studentIdDoesNotExist.tr,
            colorText: ColorConstants.black,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorConstants.white.withOpacity(.6))
        : null;
    update();
  }
}
