import 'package:get/get.dart';
import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/src/pages/cart/repository/cart_repository.dart';
import 'package:quitanda/src/pages/cart/result/cart_result.dart';
import 'package:quitanda/src/services/util_services.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();
  List<CartItemModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();
    getCartItemsController();
  }

  double cartTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  Future<void> getCartItemsController() async {
    final CartResult<CartItemModel> result = await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );

    result.when(
      success: (data) {
        cartItems.addAll(data);
        update();
      },
      error: (message) {
        UtilsServices().showToast(message: message, isError: true);
      },
    );
  }
}
