import 'package:get/get.dart';
import 'package:pet_store_admin/routes/app_routes.dart';
import 'package:pet_store_admin/shared/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final _storage = Get.find<SharedPreferences>();

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      final idAdmin = _storage.getString(AppConstants.idAdmin);
      if (idAdmin != null) {
        Get.offAllNamed(AppRoutes.homePage);
      } else {
        Get.offAllNamed(AppRoutes.signInPage);
      }
    });
    super.onInit();
  }
}
