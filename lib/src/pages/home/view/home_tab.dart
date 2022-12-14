// ignore_for_file: library_prefixes

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/base/controller/navigation_controller.dart';
import 'package:quitanda/src/pages/cart/controller/cart_controller.dart';
import 'package:quitanda/src/pages/home/view/components/category_tile.dart';
import 'package:quitanda/src/pages/home/view/components/item_tile.dart';
import 'package:quitanda/src/pages/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);

  final searchController = TextEditingController();
  final navigationController = Get.find<NavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      //appBar contendo Título e o Badge
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        //título da página home
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30),
            ),
            Text(
              'Quitanda',
              style: TextStyle(
                fontSize: 30,
                color: CustomColors.customSwatchColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Toledo',
              style: TextStyle(
                fontSize: 30,
                color: CustomColors.customContrastColor,
              ),
            ),
          ],
        ),

        // Badge (Ícone do carrinho indicando quantos itens (não quantidade) que foram comprados)
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 15.0),
            child: GetBuilder<CartController>(
              builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    Get.back();
                    navigationController.navigatePageView(NavigationTabs.cart);
                  },
                  child: Badge(
                    badgeColor: CustomColors.customContrastColor,
                    badgeContent: Text(
                      controller.cartItems.length.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: Icon(Icons.shopping_cart,
                        color: CustomColors.customSwatchColor),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),
          // Campo de pesquisa
          GetBuilder<HomeController>(
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    controller.searchTitle.value = value;
                  },
                  decoration: InputDecoration(
                    suffixIcon: controller.searchTitle.value.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              searchController.clear();
                              controller.searchTitle.value = '';
                              FocusScope.of(context).unfocus();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 20,
                              color: CustomColors.customContrastColor,
                            ),
                          )
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    hintText: 'Pesquise aqui...',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none),
                    ),
                  ),
                ),
              );
            },
          ),

          //Categorias
          GetBuilder<HomeController>(
            builder: (controller) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                child: controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            category: controller.categories[index].title,
                            isSelected: controller.categories[index] ==
                                controller.currentCategory,
                            onPressed: () {
                              controller
                                  .selectCategory(controller.categories[index]);
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 5),
                        itemCount: controller.categories.length),
              );
            },
          ),

          //Grid de Produtos
          GetBuilder<HomeController>(
            //Controller de HomeController para acessar os Produtos
            builder: (controller) {
              return controller.isLoadingProduct.value
                  ? const Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: CircularProgressIndicator())
                  : Expanded(
                      child: Visibility(
                        visible: (controller.currentCategory?.items ?? [])
                            .isNotEmpty,
                        replacement: Column(
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 150)),
                            Icon(
                              Icons.search_off,
                              size: 40,
                              color: CustomColors.customSwatchColor,
                            ),
                            const Text('Não ha itens para apresentar')
                          ],
                        ),
                        child: GridView.builder(
                          padding: const EdgeInsets.all(10.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: controller.allProducts.length,
                          itemBuilder: (context, index) {
                            if (((index + 1) ==
                                    controller.allProducts.length) &&
                                !controller.isLastPage) {
                              controller.loadMoreProducts();
                            }
                            return ItemTile(
                                item: controller.allProducts[index]);
                          },
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
