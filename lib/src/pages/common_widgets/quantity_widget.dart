import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    Key? key,
    required this.suffixText,
    required this.value,
    required this.result,
    this.isRemovable = false,
  }) : super(key: key);

  final int value;
  final String suffixText;
  final bool isRemovable;

  //funcao que recebe um int como parametro e o nome dela é result
  final Function(int quantity) result;

  @override
  Widget build(BuildContext context) {
    //Quantidade de produto e botoes de acionar e remover item
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _QuantityButton(
            icon: !isRemovable || value > 1
                ? Icons.remove_circle
                : Icons.delete_forever,
            color: !isRemovable || value > 1 ? Colors.grey : Colors.red,
            onPressed: () {
              if (value == 1 && !isRemovable) return;

              int resultCount = value - 1;

              result(resultCount);
            },
          ),
          Text('$value $suffixText'),
          _QuantityButton(
            icon: Icons.add_circle,
            color: Colors.amber,
            onPressed: () {
              int resultCount = value + 1;
              result(resultCount);
            },
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  const _QuantityButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
