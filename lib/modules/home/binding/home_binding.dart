import 'package:get/get.dart';
import 'package:pet_store_admin/modules/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => HomeController());
  }
}