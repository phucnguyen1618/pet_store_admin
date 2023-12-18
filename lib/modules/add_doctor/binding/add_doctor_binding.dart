import 'package:get/get.dart';
import 'package:pet_store_admin/modules/add_doctor/controller/add_doctor_controller.dart';

class AddDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddDoctorController());
  }
}
