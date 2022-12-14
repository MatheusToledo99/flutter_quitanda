import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/item/item_model.dart';
import 'package:quitanda/src/pages/cart/controller/cart_controller.dart';
import 'package:quitanda/src/pages_routes/app_pages.dart';
import 'package:quitanda/src/services/util_services.dart';

class ItemTile extends StatelessWidget {
  ItemTile({Key? key, required this.item}) : super(key: key);

  final ItemModel item;

  final cartController = Get.find<CartController>();

  final UtilsServices utilsservices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Card contendo foto, nome, preço e unidade
        GestureDetector(
          onTap: () {
            Get.toNamed(PagesRoutes.productRoute, arguments: item);
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //
                  //Imagem
                  Expanded(
                    child: Image.network(item.imgUrl),
                  ),

                  //Nome
                  Text(
                    item.itemName,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),

                  //Preço e Unidade
                  Row(
                    children: [
                      Text(
                        utilsservices.priceToCurrency(item.price),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),
                      Text(
                        '/${item.unit}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        //Container para comprar produto, esse Container fica  por cima do Card
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {
              cartController.addItemToCartCrtl(item: item);
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: const Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
