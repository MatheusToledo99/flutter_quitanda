import 'package:get/get.dart';
import 'package:quitanda/src/models/category/category_model.dart';
import 'package:quitanda/src/pages/home/repository/home_repository.dart';
import 'package:quitanda/src/pages/home/result/home_result.dart';
import 'package:quitanda/src/services/util_services.dart';

class HomeController extends GetxController {
  //
  final utilsServices = UtilsServices();
  final homerepository = HomeRepository();
  List<CategoryModel> categories = [];
  RxBool isLoading = false.obs;
  CategoryModel? currentCategory;

  selectCategory(CategoryModel category) {
    currentCategory = category;
    update();
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
      utilsServices.showToast(
          message: 'Ocorreu um erro ao carregar os produtos', isError: true);
    });
  }
}
