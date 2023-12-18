import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/add_doctor/controller/add_doctor_controller.dart';
import 'package:pet_store_admin/shared/utils/app_utils.dart';
import 'package:pet_store_admin/shared/utils/dialog_utils.dart';
import 'package:pet_store_admin/shared/widgets/text_input.dart';

import 'add_image_doctor.dart';

class AddDoctorPage extends GetView<AddDoctorController> {
  const AddDoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Thêm bác sĩ',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Form(
          key: controller.globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextInput(
                textController: controller.nameController,
                title: 'Họ và tên',
                isRequired: true,
                hint: 'Nhập họ và tên',
                validatorInput: (input) => input == null || input.isEmpty
                    ? 'Trường dữ liệu là bắt buộc'
                    : null,
              ),
              const SizedBox(height: 12.0),
              TextInput(
                textController: controller.phoneController,
                title: 'Số điện thoại',
                isRequired: true,
                hint: 'Nhập số điện thoại',
                validatorInput: (input) => input == null || input.isEmpty
                    ? 'Trường dữ liệu là bắt buộc'
                    : null,
              ),
              const SizedBox(height: 12.0),
              TextInput(
                textController: controller.birthdayController,
                title: 'Ngày sinh',
                isRequired: false,
                hint: 'Nhập ngày sinh của bạn',
                isReadOnly: true,
                suffixWidget: IconButton(
                  onPressed: () {
                    DialogUtils.showChooseBirthDayDialog((dateTime) {
                      controller.birthdayController.text =
                          AppUtils.formatBirthdayDateTime(dateTime);
                      controller.dateTimeBirthday.value = dateTime;
                    });
                  },
                  icon: Icon(
                    Icons.event,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              RichText(
                  text: const TextSpan(
                      text: 'Giới tính',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      children: [
                    TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                        ))
                  ])),
              const SizedBox(height: 8.0),
              Obx(() => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: RadioListTile<int>(
                          value: 0,
                          contentPadding: EdgeInsets.zero,
                          groupValue: controller.sexValue.value,
                          onChanged: (value) {
                            controller.sexValue.value = value ?? 0;
                          },
                          title: const Text('Nam'),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<int>(
                          value: 1,
                          contentPadding: EdgeInsets.zero,
                          groupValue: controller.sexValue.value,
                          onChanged: (value) {
                            controller.sexValue.value = value ?? 1;
                          },
                          title: const Text('Nữ'),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 12.0),
              RichText(
                  text: const TextSpan(
                      text: 'Ảnh đại diện',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      children: [
                    TextSpan(
                        text: ' *',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16.0,
                        ))
                  ])),
              const SizedBox(height: 8.0),
              AddImageDoctor(onAdd: (imageFile) {
                controller.imageFile.value = imageFile;
              }),
              const SizedBox(height: 12.0),
              TextInput(
                textController: controller.specializeController,
                title: 'Chuyên môn chính',
                isRequired: true,
                hint: 'Nhập chuyên môn',
                validatorInput: (input) => input == null || input.isEmpty
                    ? 'Trường dữ liệu là bắt buộc'
                    : null,
              ),
              const SizedBox(height: 12.0),
              TextInput(
                textController: controller.experienceController,
                title: 'Số năm kinh nghiệm',
                isRequired: false,
                hint: 'Nhập số năm',
                inputType: TextInputType.number,
              ),
              const SizedBox(height: 12.0),
              TextInput(
                textController: controller.addressController,
                title: 'Địa chỉ làm việc',
                isRequired: true,
                hint: 'Nhập địa chỉ',
                maxLineInput: 5,
                validatorInput: (input) => input == null || input.isEmpty
                    ? 'Trường dữ liệu là bắt buộc'
                    : null,
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: MaterialButton(
            onPressed: () {
              controller.onConfirmAddDoctor();
            },
            minWidth: Get.width,
            height: 48.0,
            color: Colors.blue,
            elevation: 0.0,
            child: const Text(
              'Xác nhận',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
