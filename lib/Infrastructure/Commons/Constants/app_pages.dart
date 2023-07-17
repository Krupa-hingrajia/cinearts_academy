import 'package:cinearts_academy_app/Infrastructure/Commons/Constants/app_routes.dart';
import 'package:cinearts_academy_app/UI/Screens/HomeSection/home_bindings.dart';
import 'package:cinearts_academy_app/UI/Screens/HomeSection/home_screen.dart';
import 'package:cinearts_academy_app/UI/Screens/NotificationSection/notification_bindings.dart';
import 'package:cinearts_academy_app/UI/Screens/NotificationSection/notification_screen.dart';
import 'package:cinearts_academy_app/UI/Screens/OnBoardingSection/SubScreen/qrscan_screen.dart';
import 'package:cinearts_academy_app/UI/Screens/OnBoardingSection/onboarding_bindings.dart';
import 'package:cinearts_academy_app/UI/Screens/OnBoardingSection/onboarding_screen.dart';
import 'package:get/get.dart';
class AppPages {
  //static const INITIAL = RoutesConstants.onBoardingScreen;
  static final routes = [
    GetPage(
      name: RoutesConstants.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: RoutesConstants.onBoardingScreen,
      page: () => OnBoardingScreen(),
      binding: OnBoardingBindings(),
    ),
    GetPage(
      name: RoutesConstants.qrScanScreen,
      page: () => QrScanScreen(),
      binding: OnBoardingBindings(),
    ),
    GetPage(
      name: RoutesConstants.notificationScreen,
      page: () => NotificationScreen(),
      binding: NotificationBindings(),
    ),
  ];
}
