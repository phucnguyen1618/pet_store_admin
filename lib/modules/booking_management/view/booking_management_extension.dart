part of 'booking_management_page.dart';

extension BookingManagementExtension on BookingManagementPage {
  Widget _buildConfirmBookingList() {
    return Obx(() => controller.confirmBookingServiceList.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: controller.confirmBookingServiceList.length,
            itemBuilder: (context, index) => ItemBooking(
                  booking: controller.confirmBookingServiceList[index],
                  onCancel: (reason) {},
                  onConfirm: (idUser, idBooking) {},
                ))
        : const Center(
            child: Text(
            'Danh sách đặt lịch trống',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          )));
  }

  Widget _buildBookingList() {
    return Obx(() => controller.bookingServiceList.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ItemBooking(
              booking: controller.bookingServiceList[index],
              onCancel: (reason) {
                controller.onCancelBookingService(
                    controller.bookingServiceList[index].idUser,
                    controller.bookingServiceList[index].idBooking,
                    reason);
              },
              onConfirm: (idUser, booking) {
                controller.onConfirmBookingService(idUser, booking);
              },
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.bookingServiceList.length,
          )
        : const Center(
            child: Text(
            'Danh sách đặt lịch trống',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          )));
  }

  Widget _buildCancelBookingList() {
    return Obx(() => controller.cancelBookingServiceList.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ItemBooking(
              booking: controller.cancelBookingServiceList[index],
              onCancel: (reason) {},
              onConfirm: (idUser, idBooking) {},
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.cancelBookingServiceList.length,
          )
        : const Center(
            child: Text(
            'Danh sách đặt lịch trống',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          )));
  }

  Widget _buildWaitingBookingList() {
    return Obx(() => controller.awaitingBookingServiceList.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ItemBooking(
              booking: controller.awaitingBookingServiceList[index],
              onCancel: (reason) {
                controller.onCancelBookingService(
                    controller.awaitingBookingServiceList[index].idUser,
                    controller.awaitingBookingServiceList[index].idBooking,
                    reason);
              },
              onConfirm: (idUser, idBooking) {
                controller.onConfirmBookingService(idUser, idBooking);
              },
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.awaitingBookingServiceList.length,
          )
        : const Center(
            child: Text(
            'Danh sách đặt lịch trống',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          )));
  }
}
