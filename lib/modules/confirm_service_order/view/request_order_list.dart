import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../models/order.dart';
import '../../../shared/items/item_order.dart';
import '../../../shared/services/firebase_service.dart';
import '../../../shared/utils/app_utils.dart';

class RequestOrderList extends StatefulWidget {
  const RequestOrderList({super.key});

  @override
  State<RequestOrderList> createState() => _RequestOrderListState();
}

class _RequestOrderListState extends State<RequestOrderList> {
  List<Order> orderList = [];

  List<int> statusOrder = [0, 1, 2, 3];

  int status = 3;

  @override
  void initState() {
    getOrderList(status: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
                getOrderList();
              } else {
                getOrderList(status: value);
              }
            });
          },
        ),
        const SizedBox(height: 12.0),
        orderList.isNotEmpty
            ? Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ItemOrder(
                    itemOrder: orderList[index],
                    onCancel: (idUser, idOrder) {
                      onCancelOrder(idUser, idOrder);
                    },
                    onConfirm: (idUser, idOrder) {
                      onConfirmOrder(idUser, idOrder);
                    },
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: orderList.length,
                ),
              )
            : const Center(child: Text('Danh sách trống')),
      ],
    );
  }

  void getOrderList({int? status}) async {
    FirebaseService.getRequestOrders((dataList) {
      setState(() {
        if (status != null) {
          orderList = dataList.where((e) => e.status == status).toList();
        } else {
          orderList = dataList;
        }
      });
    }, (error) {
      log('Error: ${error.toString()}');
    });
  }

  void onConfirmOrder(String idUser, String id) {
    setState(() {
      FirebaseService.confirmOrder(idUser, id);
      orderList.removeWhere((e) => e.idOrder == id);
      EasyLoading.showSuccess('Đã xác nhận đơn mua hàng');
    });
  }

  void onCancelOrder(String idUser, String id) {
    setState(() {
      FirebaseService.cancelOrder(idUser, id);
      orderList.removeWhere((e) => e.idOrder == id);
      EasyLoading.showToast('Đã huỷ đơn hàng');
    });
  }
}
