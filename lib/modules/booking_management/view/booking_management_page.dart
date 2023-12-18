import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store_admin/modules/booking_management/controller/booking_management_controller.dart';

import '../../../shared/items/item_booking.dart';

part 'booking_management_extension.dart';

class BookingManagementPage extends GetView<BookingManagementController> {
  const BookingManagementPage({super.key});

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
            'Quản lý đặt lịch',
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
              Tab(text: 'Đã xác nhận'),
              Tab(text: 'Đã huỷ'),
            ],
            isScrollable: true,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(children: [
                _buildBookingList(),
                _buildWaitingBookingList(),
                _buildConfirmBookingList(),
                _buildCancelBookingList(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
