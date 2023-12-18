import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/confirm_service_order/controller/confirm_service_order_controller.dart';
import 'package:pet_store_admin/modules/confirm_service_order/view/request_booking_list.dart';
import 'package:pet_store_admin/modules/confirm_service_order/view/request_order_list.dart';

class ConfirmServiceOrderPage extends GetView<ConfirmServiceOrderController> {
  const ConfirmServiceOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: const Text(
            'Xác nhận đơn hàng',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(tabs: [
            Tab(text: 'Mua hàng'.toUpperCase()),
            Tab(text: 'Đặt lịch'.toUpperCase()),
          ]),
        ),
        body: const Column(
          children: [
            Expanded(
              child: TabBarView(children: [
                RequestOrderList(),
                RequestBookingList(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
