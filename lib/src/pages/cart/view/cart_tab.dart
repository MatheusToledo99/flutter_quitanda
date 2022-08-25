// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/cart/controller/cart_controller.dart';
import 'package:quitanda/src/pages/cart/view/components/cart_tile.dart';
import 'package:quitanda/src/pages/orders/controller/orders_controller.dart';
import 'package:quitanda/src/services/util_services.dart';

class CartTab extends StatelessWidget {
  CartTab({Key? key}) : super(key: key);
  final orderController = Get.find<OrdersController>();
  final UtilsServices utilsservices = UtilsServices();
  final cartController = Get.find<CartController>();

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
            child: GetBuilder<CartController>(
              builder: (controller) {
                return controller.cartItems.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.cartItems.length,
                        itemBuilder: (context, index) {
                          return CartTile(
                            cartItem: controller.cartItems[index],
                          );
                        },
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Não há itens no seu carrinho!',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Icon(
                              Icons.remove_shopping_cart_outlined,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ],
                      );
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
                //
                //Total Geral
                const Text('Total Geral'),

                //Preço do produto
                GetBuilder<CartController>(
                  builder: (controller) {
                    return Text(
                      utilsservices.priceToCurrency(
                          controller.cartTotalPriceController()),
                      style: TextStyle(
                        fontSize: 23,
                        color: CustomColors.customSwatchColor,
                      ),
                    );
                  },
                ),

                //Botao para concluir o pedido
                SizedBox(
                  height: 50,
                  child: GetBuilder<CartController>(
                    builder: (controller) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          primary: CustomColors.customSwatchColor,
                        ),
                        onPressed: controller.isLoading
                            ? null
                            : () async {
                                bool? result =
                                    await showOrderConfirmation(context);

                                if (result ?? false) {
                                  cartController.chekoutController();
                                } else {
                                  utilsservices.showToast(
                                      message: 'Pedido não concluído');
                                }
                              },
                        child: controller.isLoading
                            ? const CircularProgressIndicator()
                            : const Text('Concluir Pedido',
                                style: TextStyle(fontSize: 18.0)),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> showOrderConfirmation(BuildContext context) {
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
                orderController.getAllOrdersController();
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
