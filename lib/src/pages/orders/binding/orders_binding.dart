import 'package:get/get.dart';
import 'package:quitanda/src/pages/orders/controller/orders_controller.dart';

class OrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OrdersController());
  }
}
