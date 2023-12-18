import 'package:get/get.dart';
import 'package:pet_store_admin/modules/employee_management/controller/employee_management_controller.dart';

class EmployeeManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmployeeManagementController());
  }
}
