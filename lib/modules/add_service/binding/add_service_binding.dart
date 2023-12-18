import 'package:get/get.dart';
import 'package:pet_store_admin/modules/add_service/controller/add_service_controller.dart';

class AddServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddServiceController());
  }
}
