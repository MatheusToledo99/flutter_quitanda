// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/pages/orders/controller/orders_controller.dart';
import 'package:quitanda/src/pages/orders/view/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: GetBuilder<OrdersController>(
        builder: (controller) {
          return controller.allOrders.isNotEmpty
              ? ListView.separated(
                  itemCount: controller.allOrders.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) =>
                      OrderTile(order: controller.allOrders[index]),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Não há pedidos na sua conta ainda!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Icon(
                          Icons.sentiment_dissatisfied_rounded,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
