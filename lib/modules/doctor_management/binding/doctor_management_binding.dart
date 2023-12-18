import 'package:get/get.dart';
import 'package:pet_store_admin/modules/doctor_management/controller/doctor_management_controller.dart';

class DoctorManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DoctorManagementController());
  }
}
