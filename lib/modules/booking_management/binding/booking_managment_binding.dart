import 'package:get/get.dart';
import 'package:pet_store_admin/modules/booking_management/controller/booking_management_controller.dart';

class BookingManagmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingManagementController());
  }
}
