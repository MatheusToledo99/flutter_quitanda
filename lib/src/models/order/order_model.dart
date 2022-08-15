import 'package:quitanda/src/models/cart/cart_item_model.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  String status;
  String copyAndPaste;
  List<CartItemModel> items;
  double total;

  OrderModel({
    required this.id,
    required this.createdDateTime,
    required this.overdueDateTime,
    required this.status,
    required this.copyAndPaste,
    required this.items,
    required this.total,
  });
}
