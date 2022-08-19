import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/pages/common_widgets/quantity_widget.dart';
import 'package:quitanda/src/services/util_services.dart';

class CartTile extends StatefulWidget {
  const CartTile({Key? key, required this.cartItem}) : super(key: key);

  final CartItemModel cartItem;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utilsservices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          widget.cartItem.item.imgUrl,
          width: 50,
          height: 50,
        ),
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          utilsservices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            fontSize: 15,
            color: CustomColors.customSwatchColor,
          ),
        ),
        trailing: QuantityWidget(
          isRemovable: true,
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {},
        ),
      ),
    );
  }
}
