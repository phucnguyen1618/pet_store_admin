import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/add_service/controller/add_service_controller.dart';
import 'package:pet_store_admin/modules/add_service/view/add_image_service.dart';
import 'package:pet_store_admin/shared/widgets/text_input.dart';

class AddServicePage extends GetView<AddServiceController> {
  const AddServicePage({super.key});

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
          'Thêm dịch vụ',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Form(
          key: controller.globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12.0),
              TextInput(
                textController: controller.nameServiceController,
                title: 'Tên dịch vụ',
                hint: 'Nhập tên dịch vụ',
                isRequired: true,
                validatorInput: (input) => input == null || input.isEmpty
                    ? 'Trường dữ liệu này là bắt buộc'
                    : null,
              ),
              const SizedBox(height: 12.0),
              TextInput(
                textController: controller.priceServiceController,
                title: 'Giá dịch vụ',
                hint: 'Nhập giá dịch vụ',
                validatorInput: (input) => input == null || input.isEmpty
                    ? 'Trường dữ liệu này là bắt buộc'
                    : null,
                isRequired: true,
              ),
              const SizedBox(height: 12.0),
              RichText(
                  text: const TextSpan(
                      text: 'Ảnh dịch vụ',
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
              AddImageService(onAdd: (image) {
                controller.imageFile.value = image;
              }),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        MaterialButton(
          onPressed: () {
            controller.onAddService();
          },
          color: Colors.blue,
          minWidth: Get.width,
          height: 48.0,
          elevation: 0.0,
          disabledElevation: 0.0,
          child: const Text(
            'Thêm',
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
