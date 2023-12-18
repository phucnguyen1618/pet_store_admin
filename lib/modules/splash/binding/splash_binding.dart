import 'package:get/get.dart';
import 'package:pet_store_admin/modules/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(SplashController());
  }
}