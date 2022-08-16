import 'package:get/get.dart';
import 'package:quitanda/src/models/category/category_model.dart';
import 'package:quitanda/src/models/item/item_model.dart';
import 'package:quitanda/src/pages/home/repository/home_repository.dart';
import 'package:quitanda/src/pages/home/result/home_result.dart';
import 'package:quitanda/src/services/util_services.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {
  //
  //intancia do utilServices
  final utilsServices = UtilsServices();

  //instancia do HomeRepository
  final homerepository = HomeRepository();

  //metodo get apara pegar todos os produtos de uma certa categoria
  List<ItemModel> get allProducts => currentCategory?.items ?? [];

  //Lista de categorias
  List<CategoryModel> categories = [];

  //Variável que indica o carregamento das categorias
  RxBool isLoading = false.obs;

  //Variável que indica o carregamento dos produtos
  RxBool isLoadingProduct = true.obs;

  //Variável da Categoria atual
  CategoryModel? currentCategory;

  selectCategory(CategoryModel category) {
    //categoria atual recebe a categoria passada
    currentCategory = category;
    update();

    if (currentCategory!.items.isNotEmpty) return;

    getAllProductsController();
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategoriesController();
  }

  Future<void> getAllCategoriesController() async {
    isLoading.value = true;

    HomeResult<CategoryModel> homeResult =
        await homerepository.getAllCategories();

    isLoading.value = false;

    homeResult.when(success: (data) {
      categories.assignAll(data);
      if (categories.isNotEmpty) {
        selectCategory(categories.first);
      }
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }

  Future<void> getAllProductsController() async {
    Map<String, dynamic> body = {
      "page": currentCategory!.pagination,
      "categoryId": currentCategory!.id,
      "itemsPerPage": itemsPerPage
    };

    isLoadingProduct.value = true;

    HomeResult<ItemModel> homeResult =
        await homerepository.getAllProducts(body);

    isLoadingProduct.value = false;

    homeResult.when(success: (data) {
      currentCategory!.items = data;
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });
  }
}
