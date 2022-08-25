import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/models/item/item_model.dart';
import 'package:quitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/src/pages/cart/repository/cart_repository.dart';
import 'package:quitanda/src/pages/cart/result/cart_result.dart';
import 'package:quitanda/src/pages/common_widgets/payment_dialog.dart';
import 'package:quitanda/src/pages/orders/controller/orders_controller.dart';
import 'package:quitanda/src/services/util_services.dart';

class CartController extends GetxController {
  //                                                                           //
  //                                                                           //
  //                                                                           //
  //--------------------------------- VARIÁVEIS -------------------------------//
  //                                                                           //
  //                                                                           //
  //                                                                           //

  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();
  List<CartItemModel> cartItems = [];
  bool isLoading = false;
  final utilsServices = UtilsServices();

  //                                                                           //
  //                                                                           //
  //                                                                           //
  //--------------------------------- MÉTODOS ---------------------------------//
  //                                                                           //
  //                                                                           //
  //                                                                           //

//Método para quando iniciar, chamar o getCartItemsController
  @override
  void onInit() {
    super.onInit();
    getCartItemsController();
  }

//Calcular o Preço Total do carrinho
  double cartTotalPriceController() {
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
  int getIndexIdController(ItemModel item) {
    int indexItem =
        cartItems.indexWhere((element) => element.item.id == item.id);

    return indexItem;
  }

//Enviar para o repositório o item a ser adiocionado
  Future addItemToCartCrtl({int quantity = 1, required ItemModel item}) async {
    int indexItem = getIndexIdController(item);

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
          utilsServices.showToast(message: 'Produto adicionado com sucesso!');
        },
        error: (message) =>
            utilsServices.showToast(message: message, isError: true),
      );
    } else {
      //O elemento já existe
      await modifyQuantityCartItemsController(
          cartItem: cartItems[indexItem],
          quantity: cartItems[indexItem].quantity + quantity);
      utilsServices.showToast(message: 'Produto adicionado com sucesso!');
    }
    update();
  }

//Enviar para o repositório a quantidade do item a ser adionado ou removido
  Future<bool> modifyQuantityCartItemsController(
      {required CartItemModel cartItem, required int quantity}) async {
    final result = await cartRepository.modifyQuantityCartItems(
      token: authController.user.token!,
      cartItemId: cartItem.id,
      quantitity: quantity,
    );

    if (result == true) {
      if (quantity == 0) {
        cartItems.removeWhere((element) => element.id == cartItem.id);
      } else {
        cartItems.firstWhere((element) => element.id == cartItem.id).quantity =
            quantity;
      }
    } else {
      UtilsServices().showToast(
        message: 'Ocorreu um erro ao alterar as quantidades no carrinho',
        isError: true,
      );
    }

    update();
    return result;
  }

  //Finaliza a compra do carrinho e gera o pedido
  Future<void> chekoutController() async {
    isLoading = true;
    update();

    final result = await cartRepository.checkoutCart(
      token: authController.user.token!,
      total: cartTotalPriceController(),
    );

    isLoading = false;
    update();

    result.when(
      success: (data) {
        cartItems.clear();
        final orderController = Get.find<OrdersController>();
        orderController.getAllOrdersController();

        showDialog(
          context: Get.context!,
          builder: (context) => PaymentDialog(order: data),
        );
      },
      error: (message) {
        UtilsServices().showToast(message: message, isError: true);
      },
    );

    update();
  }
}
