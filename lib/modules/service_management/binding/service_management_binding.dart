import 'package:get/get.dart';
import 'package:pet_store_admin/modules/service_management/controller/service_management_controller.dart';

class ServiceManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ServiceManagementController());
  }
}