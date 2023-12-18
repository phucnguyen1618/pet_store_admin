import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/models/account.dart';
import 'package:pet_store_admin/routes/app_routes.dart';
import 'package:pet_store_admin/shared/constants/app_constants.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController extends GetxController {
  final _storage = Get.find<SharedPreferences>();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isHiddenPassword = RxBool(true);

  Future<void> onSignIn() async {
    if (globalKey.currentState!.validate()) {
      EasyLoading.show();
      FirebaseService.signIn(emailController.text, passwordController.text,
          (user) async {
        EasyLoading.dismiss();
        if (user.uid.isNotEmpty) {
          if (user.email == AppConstants.emailAdmin) {
            _storage.setString(AppConstants.idAdmin, user.uid);
            Get.offAllNamed(AppRoutes.homePage);
          } else {
            List<Account> accountList = await FirebaseService.getEmployees();
            final isExist = accountList
                .where((e) => e.email == emailController.text)
                .isNotEmpty;
            if (isExist) {
              Get.toNamed(AppRoutes.confirmServiceOrderPage);
            } else {
              EasyLoading.showToast('Tài khoản nhân viên chưa tồn tại');
            }
          }
        }
      }, (error) {
        log("Error: $error");
        EasyLoading.showError(error);
      });
    }
  }

  void onShowHiddenPassword() {
    isHiddenPassword.value = !isHiddenPassword.value;
  }
}
