import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/models/product.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';
import 'package:pet_store_admin/shared/utils/app_utils.dart';
import 'package:uuid/uuid.dart';

class AddProductController extends GetxController {
  final product = Get.arguments as Product?;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController costController = TextEditingController();

  List<String> categories = [
    'Thức ăn khô cho chó',
    'Thức ăn khô cho mèo',
    'Thức ăn dạng mềm: Xốt, Pate,...',
    'Thuốc đặc trị',
    'Sản phẩm dinh dưỡng',
    'Đồ chơi | Dụng cụ ăn uống',
    'Sữa tắm | Nước hoa | Khử mùi',
    'Sản phẩm vệ sinh',
    'Sản phẩm làm đẹp',
    'Chuồng | Lồng | Balo | Túi xách',
  ];

  RxList<String> chooseCategories = RxList<String>();
  RxnDouble discountProduct = RxnDouble(null);
  RxDouble costProduct = RxDouble(0.0);
  RxDouble priceProduct = RxDouble(0.0);
  RxnString descProduct = RxnString(null);
  RxnString imageUrl = RxnString(null);
  Rxn<File> imageProductFile = Rxn<File>(null);

  @override
  void onInit() {
    if (product != null) {
      _fillProductData();
    }
    costController.addListener(() {
      if (costController.text.isNotEmpty) {
        costProduct.value =
            double.parse(costController.text.replaceAll(',', ''));
        if (product != null) {
          priceProduct.value = getPrice();
        }
      }
    });
    super.onInit();
  }

  void onAddCategoryItem(String category) {
    if (chooseCategories.isEmpty) {
      chooseCategories.add(category);
    } else {
      if (!chooseCategories.contains(category)) {
        chooseCategories.add(category);
      }
    }
  }

  void onRemoveCategoryItem(String category) {
    chooseCategories.remove(category);
  }

  void setDiscountProduct(double value) {
    discountProduct.value = value;
    priceProduct.value = getPrice();
  }

  void setImageProduct(File value) {
    imageProductFile.value = value;
  }

  double getPrice() {
    double cost = 0.0;
    cost = costProduct.value;
    return discountProduct.value != null
        ? cost - cost * (discountProduct.value! / 100)
        : cost;
  }

  void onConfirmClick() {
    if (product != null) {
      updateProduct();
    } else {
      if (formKey.currentState!.validate()) {
        if (chooseCategories.isNotEmpty && imageProductFile.value != null) {
          String idProduct = const Uuid().v1();
          FirebaseService.uploadImageProduct(idProduct, imageProductFile.value!,
              (image) {
            Product product = Product(
                idProduct,
                nameController.text,
                image,
                costProduct.value,
                discountProduct.value,
                descController.text,
                chooseCategories);
            FirebaseService.writeProductToDb(product);
            EasyLoading.showSuccess('Thêm sản phẩm thành công');
            resetValue();
          }, (error) {
            EasyLoading.showError('Đã có lỗi xảy ra.');
          });
        } else if (chooseCategories.isEmpty) {
          EasyLoading.showToast('Bạn chưa chọn thể loại sản phẩm');
        } else if (imageProductFile.value == null) {
          EasyLoading.showToast('Ảnh sản phẩm là bắt buộc');
        }
      }
    }
  }

  void _fillProductData() {
    nameController.text = product!.name;
    costController.text = AppUtils.formatPrice(product!.cost);
    costProduct.value = product!.cost;
    if (product!.desc != null) {
      descController.text = product!.desc ?? '';
    }
    chooseCategories.addAll(product!.categories);
    if (product!.discount != null) {
      discountProduct.value = product!.discount;
      priceProduct.value = product!.getPrice();
    }
    imageUrl.value = product!.image;
  }

  void updateProduct() {
    FirebaseService.updateProduct(product!.idProduct, {
      'idProduct': product!.idProduct,
      'name': nameController.text,
      'cost': costProduct.value,
      'desc': descController.text,
      'categories': chooseCategories,
      'image': product!.image,
      'discount': discountProduct.value,
    });
    EasyLoading.showToast('Cập nhật thành công');
  }

  void resetValue() {
    formKey.currentState!.reset();
    imageProductFile.value = null;
    chooseCategories.clear();
    if (discountProduct.value != null) {
      discountProduct.value = null;
    }
  }
}
