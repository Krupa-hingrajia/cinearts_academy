import 'package:cinearts_academy_app/UI/Screens/HomeSection/home_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}