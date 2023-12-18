import 'package:json_annotation/json_annotation.dart';

import 'booking_detail.dart';

part 'booking.g.dart';

@JsonSerializable()
class Booking {
  @JsonKey(name: 'booking_id')
  String idBooking;
  @JsonKey(name: 'user_id')
  String idUser;
  @JsonKey(name: 'doctor_id')
  String idDoctor;
  @JsonKey(name: 'booking_details')
  List<BookingDetail> bookingDetails;
  DateTime orderDateTime;
  String? address;
  double totalAmount;
  //0 là đang chờ, 1 là xác nhận, 2 là huỷ đặt lịch
  int status;
  String? reasonCancel;

  Booking(
    this.idBooking,
    this.idUser,
    this.idDoctor,
    this.bookingDetails,
    this.orderDateTime,
    this.address,
    this.totalAmount,
    this.status,
    this.reasonCancel,
  );

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);

  Map<String, dynamic> convertToJson() {
    return {
      "booking_id": idBooking,
      "user_id": idUser,
      "doctor_id": idDoctor,
      "booking_details": bookingDetails.map((e) => e.toJson()).toList(),
      "orderDateTime": orderDateTime.toIso8601String(),
      "address": address,
      "totalAmount": totalAmount,
      "status": status,
      "reason_cancel": reasonCancel,
    };
  }
}
