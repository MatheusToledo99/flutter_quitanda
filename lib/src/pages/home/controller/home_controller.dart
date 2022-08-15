import 'package:get/get.dart';
import 'package:quitanda/src/pages/home/repository/home_repository.dart';
import 'package:quitanda/src/pages/home/result/home_result.dart';
import 'package:quitanda/src/services/util_services.dart';

class HomeController extends GetxController {
  //
  final utilsServices = UtilsServices();
  final homerepository = HomeRepository();

  RxBool isLoading = false.obs;

  Future<void> getAllCategoriesController() async {
    isLoading.value = true;

    HomeResult homeResult = await homerepository.getAllCategories();

    isLoading.value = false;

    homeResult.when(success: (data) {}, error: (message) {});
  }
}
