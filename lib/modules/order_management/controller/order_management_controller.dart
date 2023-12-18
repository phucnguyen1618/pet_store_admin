import 'package:get/get.dart';
import 'package:pet_store_admin/shared/services/firebase_service.dart';

import '../../../models/order.dart';

class OrderManagementController extends GetxController {
  RxList<Order> orders = RxList<Order>();
  RxList<Order> awaitingOrders = RxList<Order>();
  RxList<Order> cancelOrders = RxList<Order>();
  RxList<Order> confirmOrders = RxList<Order>();

  @override
  Future<void> onInit() async {
    orders.value = await FirebaseService.getOrders();
    awaitingOrders.value = orders.where((item) => item.status == 0).toList();
    confirmOrders.value = orders.where((item) => item.status == 1).toList();
    cancelOrders.value = orders.where((item) => item.status == 2).toList();
    super.onInit();
  }

  void onConfirmOrder(String idUser, String id) {
    Order order = orders.where((item) => item.idOrder == id).first;
    order.status == 1;
    FirebaseService.confirmOrder(idUser, id);
    confirmOrders.add(order);
  }

  void onCancelOrder(String idUser, String id) {
    Order order = orders.where((item) => item.idOrder == id).first;
    order.status == 2;
    FirebaseService.cancelOrder(idUser, id);
    cancelOrders.add(order);
  }
}
