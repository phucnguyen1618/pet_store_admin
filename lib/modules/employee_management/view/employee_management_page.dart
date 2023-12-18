import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/employee_management/controller/employee_management_controller.dart';
import 'package:pet_store_admin/shared/items/item_employee.dart';
import 'package:pet_store_admin/shared/utils/dialog_utils.dart';

class EmployeeManagementPage extends GetView<EmployeeManagementController> {
  const EmployeeManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Quản lý nhân viên',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                DialogUtils.showAddEmployeeDialog((email, name) {
                  controller.onCreateAccount(email, name);
                });
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          Obx(() => controller.employees.isNotEmpty
              ? Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) => ItemEmployee(
                      account: controller.employees[index],
                      onDelete: (id) {
                        DialogUtils.showRemoveEmployeeDialog(() {
                          controller.onDeleteAccount(id);
                        });
                      },
                    ),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: controller.employees.length,
                    shrinkWrap: true,
                  ),
                )
              : const Center(child: Text('Danh sách tài khoản trống')))
        ],
      ),
    );
  }
}
