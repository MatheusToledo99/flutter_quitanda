import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/models/item/item_model.dart';
import 'package:quitanda/src/pages/base/controller/navigation_controller.dart';
import 'package:quitanda/src/pages/cart/controller/cart_controller.dart';
import 'package:quitanda/src/pages/common_widgets/quantity_widget.dart';
import 'package:quitanda/src/pages/home/view/home_tab.dart';
import 'package:quitanda/src/services/util_services.dart';

// ignore: must_be_immutable
class ProductScreen extends StatelessWidget {
  ProductScreen({
    Key? key,
  }) : super(key: key);

  final ItemModel item = Get.arguments;

  final cartController = Get.find<CartController>();

  final UtilsServices utilsservices = UtilsServices();

  int cartItemQuantity = 1;

  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              //
              //Imagem expandida
              Expanded(
                child: Image.network(item.imgUrl),
              ),

              //Container Expandido para Exibição do Conteúdo
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30.0),
                    ),
                  ),

                  //Conteúdo
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //Nome + Quantidade
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Nome do produto
                          Expanded(
                            child: Text(
                              item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                          ),
                          //Quantidade do produto
                          QuantityWidget(
                              suffixText: item.unit,
                              value: cartItemQuantity,
                              result: (quantity) {
                                // setState(() {
                                //   cartItemQuantity = quantity;
                                // });
                              }),
                        ],
                      ),

                      //Preço do Produto
                      Text(
                        utilsservices.priceToCurrency(item.price),
                        style: TextStyle(
                          fontSize: 40,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),

                      //Descrição do Produto
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SingleChildScrollView(
                            child: Text(
                              item.description,
                              style: const TextStyle(
                                fontSize: 15,
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      //Botao de adicionar ao carrinho (tela detalhada dos produtos)
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          onPressed: () {
                            //Fechar esta tab
                            Get.back();

                            //Injeção de dependência, chamando o metodo para adicionar item
                            cartController.addItemToCartCrtl(item: item);

                            //Ir para a Tab do carrinho.
                            //Neste caso não usamos o Get.offNamed pois não é uma nova tela, e sim uma TAB.

                            navigationController
                                .navigatePageView(NavigationTabs.cart);
                          },
                          child: const Text('Adicionar ao carrinho',
                              style: TextStyle(fontSize: 18.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //Botão que também adiciona o produto ao carrinho (tela de todos os produtos)
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop(
                    MaterialPageRoute(
                      builder: (context) => HomeTab(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}
