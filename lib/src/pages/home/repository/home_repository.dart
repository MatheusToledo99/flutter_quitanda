import 'package:quitanda/src/constants/endpoints.dart';
import 'package:quitanda/src/models/category_model.dart';
import 'package:quitanda/src/pages/home/result/home_result.dart';
import 'package:quitanda/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<HomeResult> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getCategoryList,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      //Lista de categorias
      final List<CategoryModel> data =
          (result['result'] as List<Map<String, dynamic>>)
              .map(CategoryModel.fromJson)
              .toList();
      return HomeResult<CategoryModel>.success(data);
    } else {
      return HomeResult.error(
          'Ocorreu um erro inesperável ao recuperar as categorias');
    }
  }
}
