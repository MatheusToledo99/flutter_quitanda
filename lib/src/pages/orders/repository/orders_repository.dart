import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/models/order/order_model.dart';
import 'package:quitanda/src/pages/orders/result/orders_result.dart';
import 'package:quitanda/src/services/http_manager.dart';

class OrdersRepository {
  final HttpManager _httpManager = HttpManager();

  Future<OrdersResult<List<OrderModel>>> getAllOrders({
    required String userId,
    required String token,
  }) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getOrders,
      method: HttpMethods.post,
      body: {
        'user': userId,
      },
      headers: {
        'X-Parse-Session-Token': token,
      },
    );
    if (result['result'] != null) {
      final List<OrderModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map(OrderModel.fromJson)
              .toList();
      return OrdersResult.success(data);
    } else {
      return OrdersResult.error('Erro ao recuperar os dados');
    }
  }

  Future<OrdersResult<List<CartItemModel>>> getItemsOnOrders(
      {required String orderId, required String token}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getOrderItems,
      method: HttpMethods.post,
      body: {
        'orderId': orderId,
      },
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    if (result['result'] != null) {
      final List<CartItemModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map(CartItemModel.fromJson)
              .toList();
      return OrdersResult.success(data);
    } else {
      return OrdersResult.error('Erro ao recuperar os produtos do pedido');
    }
  }
}
