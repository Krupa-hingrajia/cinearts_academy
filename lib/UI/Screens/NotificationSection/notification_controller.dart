// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cinearts_academy_app/Infrastructure/DataBase/notification_database.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  NotificationDBHelper notificationDB = NotificationDBHelper();
  var notifications;
  var reversedData;
  RxBool isNotificationsAvailable=false.obs;

  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  Future<void> getNotification() async {
    notifications = await notificationDB.readNotificationsData();
    if(notifications!=null)
      {
        isNotificationsAvailable.value=true;
        update();
      }
  }
}
