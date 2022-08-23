import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/models/order/order_model.dart';
import 'package:quitanda/src/services/util_services.dart';

class PaymentDialog extends StatelessWidget {
  PaymentDialog({Key? key, required this.order}) : super(key: key);

  final OrderModel order;
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          //Conteúdo
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Título
                const Text(
                  'Pagamento com Pix',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),

                //QR Code
                // QrImage(
                //   data: "1234567890",
                //   version: QrVersions.auto,
                //   size: 200.0,
                // ),
                Image.memory(
                  width: 200,
                  height: 200,
                  utilsServices.decodeQrCodeImage(order.qrCodeImage),
                ),

                //Vencimento
                Text(
                  'Vencimento: ${utilsServices.formatDateTime(order.overdueDateTime)}',
                  // style: const TextStyle(fontSize: 12),
                ),

                //Total
                Text(
                  '\nTotal: ${utilsServices.priceToCurrency(order.total)}\n',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),

                //Botão copia e cola
                OutlinedButton.icon(
                  onPressed: () {
                    FlutterClipboard.copy(order.copyAndPaste);
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text('Copiar código Pix'),
                )
              ],
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          )
        ],
      ),
    );
  }
}
