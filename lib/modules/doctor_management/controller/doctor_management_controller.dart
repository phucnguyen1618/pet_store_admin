import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';

import '../../../models/doctor.dart';

class DoctorManagementController extends GetxController {
  RxList<Doctor> doctors = RxList<Doctor>();

  @override
  void onInit() {
    getDoctorList();
    super.onInit();
  }

  void getDoctorList() {
    FirebaseService.getDoctors((dataList) {
      doctors.value = dataList;
    }, (error) => log('Error: $error'));
  }

  void onRemoveDoctor(String id) {
    doctors.removeWhere((e) => e.id == id);
    FirebaseService.removeDoctor(id);
  }
}
