import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/models/service.dart' as serviceModel;
import 'package:pet_store_admin/modules/service_management/controller/service_management_controller.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';
import 'package:uuid/uuid.dart';

class AddServiceController extends GetxController {
  TextEditingController nameServiceController = TextEditingController();
  TextEditingController priceServiceController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  Rxn<File> imageFile = Rxn<File>();

  final serviceController = Get.find<ServiceManagementController>();

  void onAddService() {
    if (globalKey.currentState!.validate()) {
      if (imageFile.value != null) {
        String idService = const Uuid().v4();
        FirebaseService.uploadImageService(idService, imageFile.value!,
            (image) {
          double price = double.tryParse(priceServiceController.text) ?? 0;
          serviceModel.Service service = serviceModel.Service(
              idService, nameServiceController.text, image, price);
          FirebaseService.writeServiceToDb(service);
          EasyLoading.showToast('Thêm dịch vụ thành công');
          serviceController.services.add(service);
        }, (error) => log('Error: $error'));
      } else {
        EasyLoading.showToast('Chưa có chọn ảnh dịch vụ');
      }
    }
  }
}
