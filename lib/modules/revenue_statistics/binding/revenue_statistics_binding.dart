import 'package:get/get.dart';
import 'package:pet_store_admin/modules/revenue_statistics/controller/revenue_statistics_controller.dart';

class RevenueStatisticsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RevenueStatisticsController());
  }
}
