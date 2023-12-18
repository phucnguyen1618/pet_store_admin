import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/home/controller/home_controller.dart';
import 'package:pet_store_admin/routes/app_routes.dart';
import 'package:pet_store_admin/shared/utils/dialog_utils.dart';

part 'home_extension.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        title: const Text(
          'Pet Store Admin',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12.0),
          _buildBaseMethodUI(),
          const Spacer(),
          Center(
            child: ButtonTheme(
              minWidth: Get.width - 12 * 2,
              height: 48.0,
              child: MaterialButton(
                onPressed: () {
                  DialogUtils.showSignOutDialog(
                    () => controller.onSignOut(),
                  );
                },
                color: Colors.red,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Text(
                  'Đăng xuất',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
