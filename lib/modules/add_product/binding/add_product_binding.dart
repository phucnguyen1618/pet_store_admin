import 'package:get/get.dart';
import 'package:pet_store_admin/modules/add_product/controller/add_product_controller.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductController());
  }
}