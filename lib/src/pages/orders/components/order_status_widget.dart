import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  OrderStatusWidget({Key? key, required this.status, required this.isOverdue})
      : super(key: key);

  final String status;

  int get currentStatus => allStatus[status]!;

  final bool isOverdue;
  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_perchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _StatusDot(isActive: true, title: 'Pedido Confirmado'),
        if (currentStatus == 1) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pix estornado',
            backgroundColor: Colors.orange,
          )
        ] else if (isOverdue) ...[
          const _StatusDot(
            isActive: true,
            title: 'Pagamento Pix Vencido',
            backgroundColor: Colors.red,
          )
        ] else ...[
          _StatusDot(isActive: currentStatus >= 2, title: 'Pagamento'),
          _StatusDot(isActive: currentStatus >= 3, title: 'Preparando'),
          _StatusDot(isActive: currentStatus >= 4, title: 'Envio'),
          _StatusDot(isActive: currentStatus >= 5, title: 'Entregue'),
        ]
      ],
    );
  }
}

class _StatusDot extends StatelessWidget {
  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
    this.backgroundColor,
  }) : super(key: key);

  final bool isActive;
  final String title;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 6),
      child: Row(
        children: [
          //Dot (Verificação de status do pedido)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              alignment: Alignment.center,
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomColors.customSwatchColor),
                  color: isActive
                      ? backgroundColor ?? CustomColors.customSwatchColor
                      : Colors.transparent),
              child: isActive
                  ? const Icon(
                      Icons.check,
                      size: 13,
                      color: Colors.white,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }
}
