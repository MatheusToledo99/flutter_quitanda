import 'package:get/get.dart';
import 'package:quitanda/src/models/category/category_model.dart';
import 'package:quitanda/src/models/item/item_model.dart';
import 'package:quitanda/src/pages/home/repository/home_repository.dart';
import 'package:quitanda/src/pages/home/result/home_result.dart';
import 'package:quitanda/src/services/util_services.dart';

const int itemsPerPage = 6;

class HomeController extends GetxController {
  //                                                                           //
  //                                                                           //
  //                                                                           //
  //--------------------------------- VARIÁVEIS -------------------------------//
  //                                                                           //
  //                                                                           //
  //                                                                           //

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

  //                                                                           //
  //                                                                           //
  //                                                                           //
  //--------------------------------- MÉTODOS ---------------------------------//
  //                                                                           //
  //                                                                           //
  //                                                                           //

  //Quando iniciar, chamar o método de categorias
  @override
  void onInit() {
    super.onInit();
    getAllCategoriesController();
  }

  //Método para saber se estamos na última pagina do back-end
  bool get isLastPage {
    if (currentCategory!.items.length < itemsPerPage) return true;

    return currentCategory!.pagination * itemsPerPage > allProducts.length;
  }

  //Selecionar a categoria
  selectCategory(CategoryModel category) {
    //categoria atual recebe a categoria passada
    currentCategory = category;
    update();

    if (currentCategory!.items.isNotEmpty) return;

    getAllProductsController();
  }

  //Método pegar todas as categorias
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

    update();
  }

  //Método pegar todos os produtos pela categoria atual
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
      currentCategory!.items.addAll(data);
    }, error: (message) {
      utilsServices.showToast(message: message, isError: true);
    });

    update();
  }

  //Método para aumentar a páginação
  void loadMoreProducts() {
    currentCategory!.pagination++;
    getAllProductsController();
  }
}
