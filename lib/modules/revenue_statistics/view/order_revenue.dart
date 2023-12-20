import 'package:flutter/material.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';

import '../../../models/booking.dart';
import '../../../models/order.dart';
import '../../../shared/utils/app_utils.dart';

class OrderRevenue extends StatefulWidget {
  final DateTime? dateTime;

  const OrderRevenue({super.key, this.dateTime});

  @override
  State<OrderRevenue> createState() => _OrderRevenueState();
}

class _OrderRevenueState extends State<OrderRevenue> {
  List<Order> orderList = [];
  double revenueOrder = 0.0;
  List<Booking> bookingList = [];
  double revenueBooking = 0.0;
  DateTime? dateTimeValue;
  bool isLoading = true;

  @override
  void initState() {
    dateTimeValue = widget.dateTime;
    getOrders();
    getBookingList();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant OrderRevenue oldWidget) {
    if (oldWidget.dateTime != widget.dateTime) {
      setState(() {
        dateTimeValue = widget.dateTime;
        getOrders();
        getBookingList();
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? orderList.isNotEmpty && bookingList.isNotEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8.0),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Tổng doanh thu\n',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                    text:
                                        '${AppUtils.formatPrice(revenueOrder + revenueBooking)}đ',
                                    style: const TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ))
                              ])),
                      const SizedBox(height: 32.0),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                        title: const Text(
                          'Đặt lịch',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${bookingList.length} đơn đặt lịch',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black38,
                          ),
                        ),
                        trailing: Text(
                          'Doanh thu: ${AppUtils.formatPrice(revenueBooking)}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                        title: const Text(
                          'Mua hàng',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${orderList.length} đơn mua hàng',
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black38,
                          ),
                        ),
                        trailing: Text(
                          'Doanh thu: ${AppUtils.formatPrice(revenueOrder)}',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : orderList.isNotEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8.0),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'Tổng doanh thu\n',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text:
                                            '${AppUtils.formatPrice(revenueOrder + revenueBooking)}đ',
                                        style: const TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ))
                                  ])),
                          const SizedBox(height: 32.0),
                          ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            title: const Text(
                              'Mua hàng',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              '${orderList.length} đơn mua hàng',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black38,
                              ),
                            ),
                            trailing: Text(
                              'Doanh thu: ${AppUtils.formatPrice(revenueOrder)}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : bookingList.isNotEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 8.0),
                              RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                      text: 'Tổng doanh thu\n',
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                      ),
                                      children: [
                                        TextSpan(
                                            text:
                                                '${AppUtils.formatPrice(revenueOrder + revenueBooking)}đ',
                                            style: const TextStyle(
                                              fontSize: 24.0,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ))
                                      ])),
                              const SizedBox(height: 32.0),
                              ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                title: const Text(
                                  'Đặt lịch',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  '${bookingList.length} đơn đặt lịch',
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black38,
                                  ),
                                ),
                                trailing: Text(
                                  'Doanh thu: ${AppUtils.formatPrice(revenueBooking)}',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : const Center(child: Text('Dữ liệu trống'))
        : const Center(child: CircularProgressIndicator());
  }

  void getOrders() {
    FirebaseService.getOrders().then((value) {
      setState(() {
        isLoading = false;
        orderList = value;
        if (dateTimeValue != null) {
          revenueOrder = 0.0;
          orderList = orderList
              .where((e) =>
                  e.orderDateTime.day == dateTimeValue!.day &&
                  e.orderDateTime.month == dateTimeValue!.month &&
                  e.orderDateTime.year == dateTimeValue!.year)
              .toList();
        }
        for (Order value in orderList) {
          revenueOrder = revenueOrder + value.totalAmount;
        }
      });
    });
  }

  void getBookingList() {
    FirebaseService.getBookingServices().then((value) {
      setState(() {
        isLoading = false;
        bookingList = value;
        if (dateTimeValue != null) {
          revenueBooking = 0.0;
          bookingList = bookingList
              .where((e) =>
                  e.orderDateTime.day == dateTimeValue!.day &&
                  e.orderDateTime.month == dateTimeValue!.month &&
                  e.orderDateTime.year == dateTimeValue!.year)
              .toList();
        }
        for (Booking booking in bookingList) {
          revenueBooking = revenueBooking + booking.totalAmount;
        }
      });
    });
  }
}
