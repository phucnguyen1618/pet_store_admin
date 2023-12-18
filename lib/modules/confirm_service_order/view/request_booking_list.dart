import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';

import '../../../models/booking.dart';
import '../../../shared/items/item_booking.dart';
import '../../../shared/utils/app_utils.dart';

class RequestBookingList extends StatefulWidget {
  const RequestBookingList({super.key});

  @override
  State<RequestBookingList> createState() => _RequestBookingListState();
}

class _RequestBookingListState extends State<RequestBookingList> {
  List<Booking> requestBookingList = [];

  List<int> statusOrder = [0, 1, 2, 3];

  int status = 3;

  @override
  void initState() {
    getRequestBookingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12.0),
        DropdownButtonFormField(
          value: status,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12.0)),
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          hint: const Text('Chọn trạng thái đơn'),
          isExpanded: true,
          items: statusOrder
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(AppUtils.generateTitleOrderStatus(e)),
                  ))
              .toList(),
          onChanged: (int? value) {
            setState(() {
              status = value ?? 0;
              if (value == 3) {
                getRequestBookingList();
              } else {
                getRequestBookingList(status: value);
              }
            });
          },
        ),
        const SizedBox(height: 12.0),
        requestBookingList.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: requestBookingList.length,
                    itemBuilder: (context, index) => ItemBooking(
                          booking: requestBookingList[index],
                          onCancel: (reason) {
                            onCancelBookingService(
                                requestBookingList[index].idUser,
                                requestBookingList[index].idBooking,
                                reason);
                          },
                          onConfirm: (idUser, idBooking) {
                            onConfirmBookingService(
                                idUser, requestBookingList[index]);
                          },
                        )),
              )
            : const Center(
                child: Text(
                'Danh sách đặt lịch trống',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              )),
      ],
    );
  }

  void getRequestBookingList({int? status}) {
    FirebaseService.getRequestBookingLList((dataList) {
      setState(() {
        if (status != null) {
          requestBookingList =
              dataList.where((e) => e.status == status).toList();
        } else {
          requestBookingList = dataList;
        }
      });
    }, (error) => log('Error: $error'));
  }

  void onConfirmBookingService(String idUser, Booking booking) {
    setState(() {
      FirebaseService.confirmBookingService(idUser, booking.idBooking);
      requestBookingList.removeWhere((e) => e.idBooking == booking.idBooking);
      EasyLoading.showSuccess('Đã xác nhận lịch đặt');
    });
  }

  void onCancelBookingService(String idUser, String idBooking, String reason) {
    setState(() {
      FirebaseService.cancelBookingService(idUser, idBooking, reason);
      requestBookingList.removeWhere((e) => e.idBooking == idBooking);
      EasyLoading.showToast('Đã huỷ đơn đặt lịch');
    });
  }
}
