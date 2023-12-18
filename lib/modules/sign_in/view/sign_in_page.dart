import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/sign_in/controller/sign_in_controller.dart';
import 'package:pet_store_admin/shared/utils/validate_utils.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: controller.globalKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ListTile(
                  leading: Icon(
                    Icons.store,
                    color: Colors.teal,
                    size: 48.0,
                  ),
                  title: Text(
                    'Pet Store Admin',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Giúp bạn quản lý cửa hàng dễ dàng hơn',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.teal,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  controller: controller.emailController,
                  validator: (input) => ValidateUtils.validateEmail(input),
                  decoration: const InputDecoration(
                    labelText: 'Email đăng nhập',
                    hintText: 'Nhập email ở đây',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12.0),
                Obx(() => TextFormField(
                      controller: controller.passwordController,
                      obscureText: controller.isHiddenPassword.value,
                      validator: (input) =>
                          ValidateUtils.validatePassword(input),
                      decoration: InputDecoration(
                        labelText: 'Mật khẩu',
                        hintText: 'Nhập mật khẩu ở đây',
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.onShowHiddenPassword();
                            },
                            icon: Icon(controller.isHiddenPassword.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined)),
                        border: const OutlineInputBorder(),
                      ),
                    )),
                const SizedBox(height: 24.0),
                ButtonTheme(
                  height: 48.0,
                  minWidth: Get.width,
                  child: MaterialButton(
                    onPressed: () {
                      controller.onSignIn();
                    },
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    color: Colors.teal,
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
