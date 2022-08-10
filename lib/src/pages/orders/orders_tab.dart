// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;
import 'package:quitanda/src/pages/orders/components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedidos'),
      ),
      body: ListView.separated(
        itemCount: appData.orders.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) =>
            OrderTile(order: appData.orders[index]),
      ),
    );
  }
}
