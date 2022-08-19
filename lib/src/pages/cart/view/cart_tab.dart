// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/pages/cart/view/components/cart_tile.dart';
import 'package:quitanda/src/pages/common_widgets/payment_dialog.dart';
import 'package:quitanda/src/services/util_services.dart';

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  final UtilsServices utilsservices = UtilsServices();

  void removeItemFromCart(CartItemModel cartitem) {
    setState(() {
      appData.cartItems.remove(cartitem);
    });
  }

  double cartTotalPrice() {
    double total = 0;
    for (var element in appData.cartItems) {
      total += element.totalPrice();
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
      ),
      body: Column(
        children: [
          // Lista
          Expanded(
            child: ListView.builder(
              itemCount: appData.cartItems.length,
              itemBuilder: (context, index) {
                return CartTile(
                    cartItem: appData.cartItems[index],
                    remove: removeItemFromCart);
              },
            ),
          ),

          // Informações Gerais - Total / Preço / Concluir Pedido
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //Total Geral
                const Text('Total Geral'),

                //Preço do produto
                Text(
                  utilsservices.priceToCurrency(cartTotalPrice()),
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.customSwatchColor,
                  ),
                ),

                //Botao para concluir o pedido
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      primary: CustomColors.customSwatchColor,
                    ),
                    onPressed: () async {
                      bool? result = await showOrderConfirmation();
                      if (result ?? false) {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              PaymentDialog(order: appData.orders.first),
                        );
                      }
                    },
                    child: const Text('Concluir Pedido',
                        style: TextStyle(fontSize: 18.0)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Confirmação'),
          content: const Text('Deseja realmente concluir o pedido ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Não'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            ),
          ],
        );
      },
    );
  }
}
