import 'package:get/get.dart';
import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/models/order/order_model.dart';
import 'package:quitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/src/pages/orders/repository/orders_repository.dart';
import 'package:quitanda/src/pages/orders/result/orders_result.dart';
import 'package:quitanda/src/services/util_services.dart';

class OrdersController extends GetxController {
  //                                                                           //
  //                                                                           //
  //                                                                           //
  //--------------------------------- VARIÁVEIS -------------------------------//
  //                                                                           //
  //                                                                           //
  //                                                                           //

  final OrdersRepository ordersRepository = OrdersRepository();

  final authController = Get.find<AuthController>();

  List<OrderModel> allOrders = [];

  final utilsServices = UtilsServices();

  bool isLoading = false;

  //                                                                           //
  //                                                                           //
  //                                                                           //
  //--------------------------------- MÉTODOS ---------------------------------//
  //                                                                           //
  //                                                                           //
  //                                                                           //

  //Quando iniciar a aplicação, a injeção de dependência injeto o OrdersController e
  //consequentemente o método iniciar, puxando todos os pedidos

  @override
  void onInit() {
    super.onInit();
    getAllOrdersController();
  }

  //Pegar todos os pedidos
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

  //Pegar todos os items de um determinado pedido
  Future<void> getItemsOnOrdersController({required OrderModel order}) async {
    isLoading = true;

    final OrdersResult<List<CartItemModel>> result =
        await ordersRepository.getItemsOnOrders(
      orderId: order.id,
      token: authController.user.token!,
    );

    isLoading = false;

    result.when(
      success: (data) {
        order.items.assignAll(data);
        update();
      },
      error: (message) {
        utilsServices.showToast(message: message, isError: true);
      },
    );
    update();
  }
}
