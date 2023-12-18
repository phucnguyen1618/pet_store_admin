import 'package:get/get.dart';
import 'package:pet_store_admin/modules/confirm_service_order/controller/confirm_service_order_controller.dart';

class ConfirmServiceOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmServiceOrderController());
  }
}
