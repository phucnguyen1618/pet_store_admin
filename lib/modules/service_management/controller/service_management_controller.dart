import 'package:get/get.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';

import '../../../models/service.dart';

class ServiceManagementController extends GetxController {
  RxList<Service> services = RxList<Service>();

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  Future<void> initData() async {
    services.value = await FirebaseService.getServices();
  }

  void onDeleteServiceItem(String id) {
    FirebaseService.removeServiceFromDb(id);
  }

  void onEditServiceItem(String idService, dynamic data) {
    double servicePrice = double.parse(data['cost']);
    FirebaseService.updateService(idService, {
      'name': data['name'],
      'price': servicePrice,
    });
  }
}
