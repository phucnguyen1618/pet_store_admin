import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/add_product/controller/add_product_controller.dart';
import 'package:pet_store_admin/modules/add_product/view/add_image_product.dart';
import 'package:pet_store_admin/modules/add_product/view/choose_category_product.dart';
import 'package:pet_store_admin/shared/utils/app_utils.dart';
import 'package:pet_store_admin/shared/utils/dialog_utils.dart';
import 'package:pet_store_admin/shared/widgets/text_input.dart';

class AddProductPage extends GetView<AddProductController> {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Obx(() => Text(
          controller.title.value,
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextInput(
                  textController: controller.nameController,
                  title: 'Tên sản phẩm',
                  isRequired: true,
                  hint: 'Nhập tên sản phẩm',
                  validatorInput: (input) => input == null || input.isEmpty
                      ? 'Tên sản phẩm là bắt buộc'
                      : null,
                ),
                const SizedBox(height: 16.0),
                TextInput(
                  textController: controller.costController,
                  title: 'Giá sản phẩm',
                  isRequired: true,
                  hint: 'Nhập giá sản phẩm',
                  inputType: TextInputType.number,
                  validatorInput: (input) => input == null || input.isEmpty
                      ? 'Giá sản phẩm là bắt buộc'
                      : null,
                  suffixWidget: IconButton(
                    onPressed: () {
                      DialogUtils.showDiscountInputDialog((value) {
                        controller.setDiscountProduct(value);
                      });
                    },
                    splashColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    icon: const Icon(Icons.discount_outlined),
                  ),
                  help:
                      'Để cài đặt mã giảm giá trên mỗi sản phẩm, bạn có thể click vào nút icon bên phải.',
                  child: Obx(() => controller.discountProduct.value != null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Giá sau khi giảm giá:',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${AppUtils.formatPrice(controller.priceProduct.value)}đ',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox()),
                ),
                const SizedBox(height: 16.0),
                RichText(
                    text: const TextSpan(
                        text: 'Ảnh sản phẩm',
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
                AddImageProduct(
                  imageUrl: controller.imageUrl.value,
                  onAdd: (file) {
                    controller.setImageProduct(file);
                  },
                ),
                const SizedBox(height: 16.0),
                ChooseCategoryProduct(categories: controller.categories),
                const SizedBox(height: 16.0),
                TextInput(
                  textController: controller.descController,
                  title: 'Mô tả',
                  hint: 'Nhập mô tả sản phẩm ở đây...',
                  maxLineInput: 5,
                ),
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        ButtonTheme(
          minWidth: Get.width,
          height: 48.0,
          child: MaterialButton(
            onPressed: () {
              controller.onConfirmClick();
            },
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
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
