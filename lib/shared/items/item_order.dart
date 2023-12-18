import 'package:flutter/material.dart';
import 'package:pet_store_admin/shared/items/item_product_in_order.dart';
import 'package:pet_store_admin/shared/utils/app_utils.dart';

import '../../models/order.dart' as order;
import '../../models/order.dart';

class ItemOrder extends StatefulWidget {
  final order.Order itemOrder;
  final Function(String, String)? onCancel;
  final Function(String, String)? onConfirm;

  const ItemOrder({
    super.key,
    required this.itemOrder,
    this.onCancel,
    this.onConfirm,
  });

  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  int status = 0;
  Order? order;

  @override
  void initState() {
    order = widget.itemOrder;
    status = widget.itemOrder.status;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ItemOrder oldWidget) {
    if (oldWidget.itemOrder != widget.itemOrder) {
      order = widget.itemOrder;
      status = widget.itemOrder.status;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return order != null
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Ngày đặt mua: ',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black38,
                        ),
                        children: [
                          TextSpan(
                              text: AppUtils.formatOrderDateTime(
                                  order!.orderDateTime))
                        ],
                      ),
                    ),
                    Text(
                      AppUtils.formatOrderStatus(status),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppUtils.mapColorByOrderStatus(status),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => ItemProductInOrder(
                      orderDetail: order!.orderDetails[index]),
                  itemCount: order!.orderDetails.length,
                  shrinkWrap: true,
                ),
                const SizedBox(height: 16.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Tổng tiền:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${AppUtils.formatPrice(order!.totalAmount)}đ',
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                status == 0
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  status = 2;
                                  if (widget.onCancel != null) {
                                    widget.onCancel!(
                                        order!.idUser, order!.idOrder);
                                  }
                                });
                              },
                              elevation: 0.0,
                              hoverElevation: 0.0,
                              disabledElevation: 0.0,
                              color: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 0.5, color: Colors.black)),
                              child: const Text(
                                'Huỷ',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  status = 1;
                                  if (widget.onConfirm != null) {
                                    widget.onConfirm!(
                                        order!.idUser, order!.idOrder);
                                  }
                                });
                              },
                              elevation: 0.0,
                              hoverElevation: 0.0,
                              disabledElevation: 0.0,
                              color: Colors.green,
                              child: const Text(
                                'Xác nhận',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
