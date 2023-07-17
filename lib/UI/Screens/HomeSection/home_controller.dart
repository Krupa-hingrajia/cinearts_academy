// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension IterableExtensions<E> on Iterable<E> {
  Iterable<List<E>> chunked(int chunkSize) sync* {
    if (length <= 0) {
      yield [];
      return;
    }
    int skip = 0;
    while (skip < length) {
      final chunk = this.skip(skip).take(chunkSize);
      yield chunk.toList(growable: false);
      skip += chunkSize;
      if (chunk.length < chunkSize) return;
    }
  }
}

class HomeController extends GetxController {
  RxInt studentId = 0.obs;
  String whatsappLink='';
  String zoomLink = '';//whatsapp://send?phone=
  String slackLink= ''; //slack://channel?id=zt-1qt0bf5iv-1ZnraQMRSFZwV4aPIsYCKw ///https://cinearts-academy.slack.com/ssb/redirect
  RxString keyValue =  ''.obs;
  var  studentData;




  @override
  void onInit() {
    super.onInit();
    getSocials();
    grtStudentData();
  }

  grtStudentData() async {
    SharedPreferences shr=await SharedPreferences.getInstance();
   var data = shr.getString('studentData');
    studentData=jsonDecode(data!);
    update();
  }

  Future<void> getSocials() async {
   var zoom=await getZoomLink();
   var slack=await getSlackLink();
   var whatsapp=await getWhatsappLink();
   var key=await getKeyValue();
   getStudentsData();
   zoomLink=zoom.data()!['meetingLink'];
   slackLink=slack.data()!['slackLink'];
   keyValue.value=key.data()!['keyValue'];
   whatsappLink=whatsapp.data()!['whatsappNumber'].toString();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRewardsData() {
    final Rx<Stream<QuerySnapshot<Map<String, dynamic>>>> rewardStream =
        FirebaseFirestore.instance.collection('Rewards').snapshots().obs;
    return rewardStream.value;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getSlackLink() {
    final Future<DocumentSnapshot<Map<String, dynamic>>> rewardStream =
        FirebaseFirestore.instance.collection('Socials').doc('slack').get();
    return rewardStream;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getWhatsappLink() {
    final Future<DocumentSnapshot<Map<String, dynamic>>> rewardStream =
        FirebaseFirestore.instance.collection('Socials').doc('whatsapp').get();
    return rewardStream;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getZoomLink() {
    final Future<DocumentSnapshot<Map<String, dynamic>>> rewardStream =
        FirebaseFirestore.instance.collection('Socials').doc('zoom').get();
    return rewardStream;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getKeyValue() {
    final Future<DocumentSnapshot<Map<String, dynamic>>> rewardStream =
        FirebaseFirestore.instance.collection('Socials').doc('examKey').get();
    return rewardStream;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getStudentsData() async {
    final  rewardStream = await
        FirebaseFirestore.instance.collection('Students').get();
    studentId.value=rewardStream.docs[0]['studentID'];
    return rewardStream;
  }
}
