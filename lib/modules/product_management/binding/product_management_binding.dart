import 'package:get/get.dart';
import 'package:pet_store_admin/modules/product_management/controller/product_management_controller.dart';

class ProductManagementBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => ProductManagementController());
  }
}