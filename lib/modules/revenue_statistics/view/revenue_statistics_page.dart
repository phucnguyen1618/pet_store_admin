import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/revenue_statistics_controller.dart';
import 'order_revenue.dart';

class RevenueStatisticsPage extends GetView<RevenueStatisticsController> {
  const RevenueStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Báo cáo thống kê doanh thu',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OrderRevenue(),
        ],
      ),
    );
  }
}
