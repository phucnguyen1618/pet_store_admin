import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/order_management/controller/order_management_controller.dart';
import 'package:pet_store_admin/shared/items/item_order.dart';

part 'order_management_extension.dart';

class OrderManagementPage extends GetView<OrderManagementController> {
  const OrderManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: const Text(
              'Quản lý đơn hàng',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tất cả'),
                Tab(text: 'Đang chờ xác nhận'),
                Tab(text: 'Đã hoàn thành'),
                Tab(text: 'Đã huỷ')
              ],
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
            )),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(children: [
                _buildOrderList(),
                _buildAwaitingOrderList(),
                _buildConfirmOrderList(),
                _buildCancelOrderList(),
              ])
            )
          ],
        ),
      ),
    );
  }
}
