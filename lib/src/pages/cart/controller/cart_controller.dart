import 'package:get/get.dart';
import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/models/item/item_model.dart';
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

//Calcular o Preço Total do carrinho
  double cartTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

//Pegar do repositório todos os Items do Carrinho
  Future<void> getCartItemsController() async {
    final CartResult<List<CartItemModel>> result =
        await cartRepository.getCartItems(
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

//Pegar o Index do produto
  int getIndexId(ItemModel item) {
    int indexItem = cartItems.indexWhere((element) => element.id == item.id);

    return indexItem;
  }

//Enviar para o repositório o item a ser adiocionado
  Future<void> addItemToCart(
      {int quantity = 1, required ItemModel item}) async {
    int indexItem = getIndexId(item);

    if (indexItem == -1) {
      //Adicionar elemento não existente
      final CartResult<String> result = await cartRepository.addCartItems(
        token: authController.user.token!,
        userId: authController.user.id!,
        quantity: quantity,
        productId: item.id,
      );

      result.when(
        success: (dataId) {
          cartItems.add(
            CartItemModel(
              id: dataId,
              item: item,
              quantity: quantity,
            ),
          );
        },
        error: (message) =>
            UtilsServices().showToast(message: message, isError: true),
      );
    } else {
      //O elemento já existe
      cartItems[indexItem].quantity += quantity;
    }
  }
}
