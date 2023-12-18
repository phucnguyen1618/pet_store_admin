import 'dart:developer';

import 'package:get/get.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';

class ProductManagementController extends GetxController {

  void onProductDelete(String idProduct) {
    log('Deleted product with ID: $idProduct');
    FirebaseService.removeProductFromDb(idProduct);
  }
}
