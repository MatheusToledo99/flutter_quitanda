import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/pages/cart/controller/cart_controller.dart';
import 'package:quitanda/src/pages/common_widgets/quantity_widget.dart';
import 'package:quitanda/src/services/util_services.dart';

class CartTile extends StatelessWidget {
  CartTile({Key? key, required this.cartItem}) : super(key: key);

  final CartItemModel cartItem;
  final CartController cartController = Get.find<CartController>();

  final UtilsServices utilsservices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          cartItem.item.imgUrl,
          width: 50,
          height: 50,
        ),
        title: Text(
          cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          utilsservices.priceToCurrency(cartItem.totalPrice()),
          style: TextStyle(
            fontSize: 15,
            color: CustomColors.customSwatchColor,
          ),
        ),
        trailing: QuantityWidget(
          isRemovable: true,
          suffixText: cartItem.item.unit,
          value: cartItem.quantity,
          result: (quantity) {
            cartController.modifyQuantityCartItemsController(
              item: cartItem,
              quantity: quantity,
            );
          },
        ),
      ),
    );
  }
}
