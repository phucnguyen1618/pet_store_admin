import 'package:get/get.dart';
import 'package:pet_store_admin/modules/order_management/controller/order_management_controller.dart';

class OrderManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderManagementController());
  }
}
