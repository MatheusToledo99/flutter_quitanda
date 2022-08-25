import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class NavigationTabs {
  static const int home = 0;
  static const int cart = 1;
  static const int orders = 2;
  static const int profile = 3;
}

class NavigationController extends GetxController {
  //                                                                           //
  //                                                                           //
  //                                                                           //
  //--------------------------------- VARIÁVEIS -------------------------------//
  //                                                                           //
  //                                                                           //
  //                                                                           //

  late PageController _pageController;
  late RxInt _currentIndex;

  //                                                                           //
  //                                                                           //
  //                                                                           //
  //--------------------------------- MÉTODOS ---------------------------------//
  //                                                                           //
  //                                                                           //
  //                                                                           //

  //Pegar a controller da página
  PageController get pageController {
    return _pageController;
  }

  //Pegar o índice atual da página
  int get currentIndex {
    return _currentIndex.value;
  }

  //Quando iniciar, chamar a tab Home
  @override
  void onInit() {
    super.onInit();

    initNavigation(
        pageController: PageController(initialPage: NavigationTabs.home),
        currentIndex: NavigationTabs.home);
  }

  //Iniciar navegação, setando página e o indíce para permitar a navegação
  void initNavigation({
    required PageController pageController,
    required int currentIndex,
  }) {
    _pageController = pageController;
    _currentIndex = currentIndex.obs;
  }

  //navegando entre as páginas
  void navigatePageView(int page) {
    if (_currentIndex.value == page) return;

    _pageController.jumpToPage(page);
    _currentIndex.value = page;
  }
}
