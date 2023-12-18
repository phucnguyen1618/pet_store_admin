import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/routes/app_routes.dart';
import 'package:pet_store_admin/routes/pages.dart';
import 'package:pet_store_admin/shared/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<SharedPreferences>();
    return GetMaterialApp(
      title: 'Pet Store Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: storage.getString(AppConstants.idAdmin) != null
          ? AppRoutes.homePage
          : AppRoutes.splashPage,
      getPages: pages,
      builder: EasyLoading.init(),
    );
  }
}
