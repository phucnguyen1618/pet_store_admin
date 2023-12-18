import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/routes/app_routes.dart';
import 'package:pet_store_admin/shared/constants/app_constants.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

  final _storage = Get.find<SharedPreferences>();

  void onSignOut() {
    FirebaseService.signOut(() {
      _storage.remove(AppConstants.idAdmin);
      Get.offAllNamed(AppRoutes.signInPage);
    }, (error) => EasyLoading.showError(error));
  }
}