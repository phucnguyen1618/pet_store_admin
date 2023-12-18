import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/doctor_management/controller/doctor_management_controller.dart';
import 'package:pet_store_admin/shared/items/item_doctor.dart';

import '../../../routes/app_routes.dart';

class DoctorManagementPage extends GetView<DoctorManagementController> {
  const DoctorManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Quản lý bác sĩ',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => controller.doctors.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => ItemDoctor(
                            doctor: controller.doctors[index],
                            onDelete: (idDoctor) {
                              controller.onRemoveDoctor(idDoctor);
                            },
                          ),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.doctors.length),
                )
              : const Center(
                  child: Text(
                    'Danh sách bác sĩ trống',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                ))
        ],
      ),
      persistentFooterButtons: [
        MaterialButton(
          onPressed: () {
            Get.toNamed(AppRoutes.addDoctorPage);
          },
          minWidth: Get.width,
          height: 48.0,
          elevation: 0.0,
          color: Colors.blue,
          child: const Text(
            'Thêm bác sĩ',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
