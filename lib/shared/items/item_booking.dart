import 'dart:developer';

import 'package:flutter/material.dart';

import '../../models/booking.dart';
import '../../models/doctor.dart';
import '../services/firebase_service.dart';
import '../utils/app_utils.dart';
import '../utils/dialog_utils.dart';
import 'item_service_in_booking.dart';

class ItemBooking extends StatefulWidget {
  final Booking booking;
  final Function(String) onCancel;
  final Function(String, Booking) onConfirm;

  const ItemBooking({
    super.key,
    required this.booking,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  State<ItemBooking> createState() => _ItemBookingState();
}

class _ItemBookingState extends State<ItemBooking> {
  String email = '', name = '';
  int status = 0;
  int age = 0;
  Doctor? doctor;
  Booking? booking;

  @override
  void initState() {
    status = widget.booking.status;
    booking = widget.booking;
    getAccountInfo(widget.booking.idUser);
    getDoctorInfo();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ItemBooking oldWidget) {
    if (oldWidget.booking != widget.booking) {
      booking = widget.booking;
      status = widget.booking.status;
      getAccountInfo(widget.booking.idUser);
      getDoctorInfo();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return booking != null
        ? Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.event,
                          color: Colors.black26,
                          size: 16.0,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          'Ngày đặt lịch: ${AppUtils.formatBookingDateTime(booking!.orderDateTime)}',
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.black26,
                          ),
                        )
                      ],
                    ),
                    Text(
                      AppUtils.formatOrderStatus(booking!.status),
                      style: TextStyle(
                        fontSize: 14.0,
                        color: AppUtils.mapColorByOrderStatus(
                            widget.booking.status),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                      child: Text(
                    AppUtils.generateNameAvatar(name),
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                  )),
                  title: Text(
                    name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text(
                    email,
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: booking!.bookingDetails
                      .map((e) => ItemServiceInBooking(id: e.id))
                      .toList(),
                ),
                const Text(
                  'Người thực hiện',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                doctor != null
                    ? RichText(
                        text: TextSpan(
                            text: 'Bác sĩ: ',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                            TextSpan(
                              text: '${doctor!.name}  - $age tuổi',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]))
                    : const SizedBox(),
                const SizedBox(height: 16.0),
                status == 0
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                DialogUtils.showInputReasonDialog((reason) {
                                  setState(() {
                                    status = 2;
                                    widget.onCancel(reason);
                                  });
                                });
                              },
                              color: Colors.white,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: const BorderSide(
                                      width: 0.5, color: Colors.black)),
                              child: const Text('Huỷ'),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  status = 1;
                                  widget.onConfirm(
                                    booking!.idUser,
                                    booking!,
                                  );
                                });
                              },
                              color: Colors.green,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              child: const Text(
                                'Xác nhận',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,
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

  void getAccountInfo(String id) {
    FirebaseService.getAccountByID(
      id: id,
      onSuccess: (account) {
        setState(() {
          email = account.email;
          name = account.name;
        });
      },
      onError: (error) {
        log('Error: $error');
      },
    );
  }

  void getDoctorInfo() {
    FirebaseService.getDoctorByID(
      widget.booking.idDoctor,
      (doctorInfo) {
        setState(() {
          doctor = doctorInfo;
          age = DateTime.now().difference(doctorInfo.birthDay).inDays ~/ 365;
        });
      },
      (error) => log('Error: $error'),
    );
  }
}
