// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:io';

import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_pages.dart';
import 'package:cinearts_academy_app/Infrastructure/Internet/conectivity_provider.dart';
import 'package:cinearts_academy_app/Infrastructure/Language/translation_service.dart';
import 'package:cinearts_academy_app/Infrastructure/Notification/firebase_notification.dart';
import 'package:cinearts_academy_app/UI/Screens/HomeSection/home_screen.dart';
import 'package:cinearts_academy_app/UI/Screens/OnBoardingSection/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? shr;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  shr = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    name: "CineArts Academy",
    options: FirebaseOptions(
        apiKey: 'AIzaSyDX8tl30zg5NMsjQKaBXy6QelnfILHDlMY',
        appId: Platform.isIOS
            ? '1:584662604579:ios:3481f9da3545fa568dca96'
            : '1:584662604579:android:8cb3cc6a9d2863e88dca96',
        messagingSenderId: '',
        projectId: 'cinearts-academy-9a8a1'),
  );

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    CineartsNotification().getNotificationReq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 5, 7, 13)),
        home: shr!.getBool('OnBoard') == true  ? const HomeScreen(): OnBoardingScreen(),
        //home: const HomeScreen(),
        getPages: AppPages.routes,
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
      ),
    );
  }
}
