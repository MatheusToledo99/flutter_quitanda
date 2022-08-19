// ignore_for_file: avoid_print

import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/pages/cart/result/cart_result.dart';
import 'package:quitanda/src/services/http_manager.dart';

class CartRepository {
  final HttpManager _httpManager = HttpManager();

  //Buscar Itens
  Future<CartResult<CartItemModel>> getCartItems(
      {required String token, required userId}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getCartItems,
      method: HttpMethods.post,
      headers: {'X-Parse-Session-Token': token},
      body: {"user": userId},
    );

    if (result['result'] != null) {
      List<CartItemModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map(CartItemModel.fromJson)
              .toList();
      return CartResult<CartItemModel>.success(data);
    } else {
      return CartResult.error('Ocorreu um erro na requisição');
    }
  }

  //Adicionar item
  Future<void> addCartItems() async {
    _httpManager.restRequest(
        url: Endpoints.addItemToCart, method: HttpMethods.post);
  }

  //Modificar quantidade do item
  Future<void> modifyQuantityCartItems() async {
    _httpManager.restRequest(
        url: Endpoints.modifyItemQuantity, method: HttpMethods.post);
  }
}
