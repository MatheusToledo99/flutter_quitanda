import 'package:get/get.dart';
import 'package:quitanda/src/models/order/order_model.dart';
import 'package:quitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/src/pages/orders/repository/orders_repository.dart';
import 'package:quitanda/src/pages/orders/result/orders_result.dart';
import 'package:quitanda/src/services/util_services.dart';

class OrdersController extends GetxController {
  final OrdersRepository ordersRepository = OrdersRepository();

  final authController = Get.find<AuthController>();

  List<OrderModel> allOrders = [];

  final utilsServices = UtilsServices();

  @override
  void onInit() {
    super.onInit();
    getAllOrdersController();
  }

  Future<void> getAllOrdersController() async {
    OrdersResult<List<OrderModel>> result = await ordersRepository.getAllOrders(
      userId: authController.user.id!,
      token: authController.user.token!,
    );

    result.when(
      success: (data) {
        allOrders.assignAll(data);
        update();
      },
      error: (message) {
        utilsServices.showToast(
          message: message,
          isError: true,
        );
        update();
      },
    );
  }
}
