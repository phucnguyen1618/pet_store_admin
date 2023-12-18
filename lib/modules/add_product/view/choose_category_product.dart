import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/add_product/controller/add_product_controller.dart';

class ChooseCategoryProduct extends StatelessWidget {
  final List<String> categories;
  ChooseCategoryProduct({super.key, required this.categories});

  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        RichText(
            text: const TextSpan(
                text: 'Các loại sản phẩm',
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
        const SizedBox(height: 12.0),
        categories.isNotEmpty
            ? DropdownButtonFormField<String>(
                value: categories[0],
                hint: Text(categories[0]),
                decoration: const InputDecoration(border: OutlineInputBorder()),
                items: categories
                    .map((e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.onAddCategoryItem(value);
                  }
                })
            : const CircularProgressIndicator(),
        const SizedBox(height: 8.0),
        Obx(() => Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: controller.chooseCategories
                  .map((e) => Chip(
                        elevation: 0,
                        side:
                            const BorderSide(width: 0.5, color: Colors.black12),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.all(4.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0)),
                        backgroundColor: Colors.white,
                        shadowColor: Colors.black,
                        label: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        deleteIcon: const Icon(
                          Icons.close,
                          size: 14.0,
                        ),
                        deleteIconColor: Colors.black,
                        onDeleted: () {
                          controller.onRemoveCategoryItem(e);
                        },
                      ))
                  .toList(),
            ))
      ],
    );
  }
}
