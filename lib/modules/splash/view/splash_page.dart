import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/splash/controller/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.store,
              size: 56.0,
              color: Colors.teal,
            ),
            Text(
              'Pet Store Admin',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              'Giúp bạn quản lý cửa hàng dễ dàng hơn',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
