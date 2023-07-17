import 'package:cinearts_academy_app/UI/Screens/OnBoardingSection/onboarding_controller.dart';
import 'package:get/get.dart';

class NotificationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}