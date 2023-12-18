import 'package:get/get.dart';

import '../../../models/booking.dart';
import '../../../shared/services/firebase_service.dart';

class BookingManagementController extends GetxController {
  RxList<Booking> bookingServiceList = RxList<Booking>();
  RxList<Booking> awaitingBookingServiceList = RxList<Booking>();
  RxList<Booking> confirmBookingServiceList = RxList<Booking>();
  RxList<Booking> cancelBookingServiceList = RxList<Booking>();

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  Future<void> initData() async {
    bookingServiceList.value = await FirebaseService.getBookingServices();
    awaitingBookingServiceList.value =
        bookingServiceList.where((e) => e.status == 0).toList();
    confirmBookingServiceList.value =
        bookingServiceList.where((e) => e.status == 1).toList();
    cancelBookingServiceList.value =
        bookingServiceList.where((e) => e.status == 2).toList();
  }

  void onConfirmBookingService(String idUser, Booking booking) {
    awaitingBookingServiceList.remove(booking);
    booking.status = 1;
    confirmBookingServiceList.add(booking);
    FirebaseService.confirmBookingService(idUser, booking.idBooking);
  }

  void onCancelBookingService(String idUser, String idBooking, String reason) {
    FirebaseService.cancelBookingService(idUser, idBooking, reason);
  }
}
