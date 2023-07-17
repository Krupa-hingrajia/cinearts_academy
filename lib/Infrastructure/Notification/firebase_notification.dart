
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/color_constants.dart';
import 'package:cinearts_academy_app/Infrastructure/DataBase/notification_database.dart';
import 'package:cinearts_academy_app/main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CineartsNotification {
  getNotificationReq() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    final intercomToken = await messaging.getToken();
    if (intercomToken != null) {
      messaging.getInitialMessage().then((RemoteMessage? message) {
        if (message != null) {
          firebaseMessagingOnMessageHandler(message);
        }
      });

      messaging.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

       await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      FirebaseMessaging.onMessageOpenedApp.listen(
        firebaseMessagingOnMessageHandler,
      );
      FirebaseMessaging.onMessage.listen(
        _firebaseMessagingOnMessageHandlerOne,

      );
      FirebaseMessaging.onBackgroundMessage(
        firebaseMessagingOnMessageHandler,
      );
    }
  }

  Future<void> _firebaseMessagingOnMessageHandlerOne(
      RemoteMessage message,
      ) async {
    await Firebase.initializeApp();
//    ReceivedAction? initialAction;

    AwesomeNotifications().initialize(
        null, //'resource://drawable/res_app_icon',//
        [
          NotificationChannel(
              channelKey: 'alerts',
              channelName: 'Alerts',
              channelDescription: 'Notification tests as alerts',
              playSound: true,
              onlyAlertOnce: true,
              // groupAlertBehavior: GroupAlertBehavior.Children,
              importance: NotificationImportance.High,
              defaultPrivacy: NotificationPrivacy.Private,
              defaultColor: ColorConstants.primary,
              ledColor: ColorConstants.primary)
        ],
        debug: true);

    //if (Platform.isIOS) return;

    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
   // initialAction =
    await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);

    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    // if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;
    // If `onMessage` is triggered with a notification, construct our own
    // local notification to show to users using the created channel.
    if (notification != null && android != null) {
      await AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: notification.hashCode,
              channelKey: 'alerts',
              title: notification.title,
              body: notification.body,
              bigPicture: notification.android?.imageUrl,
              largeIcon: notification.android?.imageUrl,
              notificationLayout: NotificationLayout.BigPicture,
              payload: {'notificationId': '1234567890'}),
          actionButtons: [
        //  NotificationActionButton(key: 'REDIRECT', label: 'Watch'),
        //  NotificationActionButton(
        //      key: 'DISMISS',
        //      label: 'Dismiss',
        //      actionType: ActionType.DismissAction,
        //      isDangerousOption: true)
          ]);
      /// Sqlite
      NotificationDBHelper notificationDB=NotificationDBHelper();
      notificationDB.insertNotification(time: DateTime.now().toString(),notification: notification.body.toString(),);
    } else {
      notification.printError();
    }

  }
}

Future<void> firebaseMessagingOnMessageHandler(
    RemoteMessage message,
    ) async {
  await Firebase.initializeApp();
  BuildContext? context = MyApp.navigatorKey.currentContext;

  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;

  if (notification != null && android != null) {
    showDialog(
        context: context!,
        builder: (_) {
          return AlertDialog(
            title: Text(notification.title!),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notification.body!),
                ],
              ),
            ),
          );
        });
    /// Sqlite
    NotificationDBHelper notificationDB=NotificationDBHelper();
    notificationDB.insertNotification(time: DateTime.now().toString(),notification: notification.body.toString(),);
  }

}