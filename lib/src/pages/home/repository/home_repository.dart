import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/models/category/category_model.dart';
import 'package:quitanda/src/models/item/item_model.dart';
import 'package:quitanda/src/pages/home/result/home_result.dart';
import 'package:quitanda/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  //Recuperando todas as categorias de produtos
  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getCategoryList,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      //Lista de categorias
      final List<CategoryModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map(CategoryModel.fromJson)
              .toList();
      return HomeResult<CategoryModel>.success(data);
    } else {
      return HomeResult.error(
          'Ocorreu um erro inesperado ao recuperar as categorias');
    }
  }

  // Recuperando todos os produtos contidos no back-end
  Future<HomeResult<ItemModel>> getAllProducts(
      Map<String, dynamic> body) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getProductList,
      method: HttpMethods.post,
      body: body,
    );

    if (result['result'] != null) {
      //Lista de Produtos
      final List<ItemModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map(ItemModel.fromJson)
              .toList();
      return HomeResult<ItemModel>.success(data);
    } else {
      return HomeResult.error(
          'Ocorreu um erro inesperado ao recuperar os itens');
    }
  }
}
