import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/models/doctor.dart';
import 'package:pet_store_admin/modules/doctor_management/controller/doctor_management_controller.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';
import 'package:uuid/uuid.dart';

class AddDoctorController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController specializeController = TextEditingController();
  TextEditingController experienceController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  Rxn<File> imageFile = Rxn<File>();
  RxInt sexValue = RxInt(-1);
  final doctorManagement = Get.find<DoctorManagementController>();
  Rx<DateTime> dateTimeBirthday = Rx<DateTime>(DateTime.now());

  void onConfirmAddDoctor() {
    if (globalKey.currentState!.validate()) {
      if (sexValue.value == -1) {
        EasyLoading.showToast('Giới tính là bắt buộc');
      } else if (imageFile.value == null) {
        EasyLoading.showToast('Ảnh đại diện là bắt buộc');
      } else if (imageFile.value != null) {
        String idDoctor = const Uuid().v4();
        FirebaseService.uploadImageDoctor(idDoctor, imageFile.value!, (image) {
          int? experience = int.tryParse(experienceController.text);
          Doctor doctor = Doctor(
              idDoctor,
              nameController.text,
              sexValue.value,
              dateTimeBirthday.value,
              phoneController.text,
              image,
              experience,
              [],
              addressController.text);
          FirebaseService.writeDoctorToDb(doctor);
          EasyLoading.showToast('Thêm bác sĩ thành công');
          Get.back();
          doctorManagement.doctors.add(doctor);
        }, (error) => log('Error: $error'));
      }
    }
  }
}
