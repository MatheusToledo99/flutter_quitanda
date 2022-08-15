// ignore_for_file: library_prefixes

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/home/view/components/category_tile.dart';
import 'package:quitanda/src/pages/home/view/components/item_tile.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = '';

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

        // Badge (Ícone do carrinho indicando quantos itens (não quantidade) foram comprados)
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 15.0),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  '2',
                  style: TextStyle(color: Colors.white),
                ),
                child: Icon(Icons.shopping_cart,
                    color: CustomColors.customSwatchColor),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),
          // Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
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
          ),

          //Categorias
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    category: appData.categories[index],
                    isSelected: appData.categories[index] == selectedCategory
                        ? true
                        : false,
                    onPressed: () {
                      setState(() {
                        selectedCategory = appData.categories[index];
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 5),
                itemCount: appData.categories.length),
          ),

          //Grid de Produtos
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: appData.items.length,
              itemBuilder: (context, index) {
                return ItemTile(
                  item: appData.items[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
