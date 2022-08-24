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
          return ListView.separated(
            itemCount: controller.allOrders.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) =>
                OrderTile(order: controller.allOrders[index]),
          );
        },
      ),
    );
  }
}
