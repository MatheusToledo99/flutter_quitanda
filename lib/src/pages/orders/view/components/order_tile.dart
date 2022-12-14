import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/models/order/order_model.dart';
import 'package:quitanda/src/pages/common_widgets/payment_dialog.dart';
import 'package:quitanda/src/pages/orders/controller/orders_controller.dart';
import 'package:quitanda/src/pages/orders/view/components/order_status_widget.dart';
import 'package:quitanda/src/services/util_services.dart';

class OrderTile extends StatelessWidget {
  OrderTile({Key? key, required this.order}) : super(key: key);

  final OrderModel order;

  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido : ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime!),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            Row(
              children: [
                //
                //Lista de produtos
                GetBuilder<OrdersController>(
                  builder: (controller) {
                    if (order.items.isEmpty) {
                      controller.getItemsOnOrdersController(order: order);
                    }
                    return controller.isLoading
                        ? const Expanded(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 85),
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 150,
                              child: ListView(
                                children: order.items.map(
                                  (orderItem) {
                                    return _OrderItemWidget(
                                      utilsServices: utilsServices,
                                      orderItem: orderItem,
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          );
                  },
                ),

                //Divis??o Vertical
                VerticalDivider(
                  color: Colors.grey.shade300,
                  thickness: 2.0,
                  width: 8.0,
                ),

                //Status do Pedido
                Expanded(
                  flex: 2,
                  child: OrderStatusWidget(
                      status: order.status,
                      isOverdue:
                          order.overdueDateTime.isBefore(DateTime.now())),
                ),
              ],
            ),

            //Total
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                ),
                children: [
                  const TextSpan(
                    text: 'Total ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: utilsServices.priceToCurrency(order.total),
                  ),
                ],
              ),
            ),

            //Bot??o para abrir QRCode.

            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => PaymentDialog(order: order),
                  );
                },
                icon: Image.asset('assets/app_images/pix.png', height: 18),
                label: const Text('Ver QR Code Pix'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilsServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text('${orderItem.quantity} ${orderItem.item.unit}  ',
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice())),
        ],
      ),
    );
  }
}
