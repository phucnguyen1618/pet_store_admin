part of 'order_management_page.dart';

extension OrderManagementExtension on OrderManagementPage {
  Widget _buildOrderList() {
    return Obx(() => controller.orders.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ItemOrder(
              itemOrder: controller.orders[index],
              onCancel: (idUser, idOrder) {
                controller.onCancelOrder(idUser, idOrder);
              },
              onConfirm: (idUser, idOrder) {
                controller.onConfirmOrder(idUser, idOrder);
              },
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.orders.length,
          )
        : const Center(child: Text('Danh sách trống')));
  }

  Widget _buildAwaitingOrderList() {
    return Obx(() => controller.awaitingOrders.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ItemOrder(
              itemOrder: controller.awaitingOrders[index],
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.awaitingOrders.length,
          )
        : const Center(
            child: Text('Danh sách trống'),
          ));
  }

  Widget _buildConfirmOrderList() {
    return Obx(() => controller.confirmOrders.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ItemOrder(
              itemOrder: controller.confirmOrders[index],
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.confirmOrders.length,
          )
        : const Center(
            child: Text('Danh sách trống'),
          ));
  }

  Widget _buildCancelOrderList() {
    return Obx(() => controller.cancelOrders.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => ItemOrder(
              itemOrder: controller.cancelOrders[index],
            ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: controller.cancelOrders.length,
          )
        : const Center(
            child: Text('Danh sách trống'),
          ));
  }
}
