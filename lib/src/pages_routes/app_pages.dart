import 'package:get/get.dart';
import 'package:quitanda/src/pages/auth/view/sign_in_screen.dart';
import 'package:quitanda/src/pages/auth/view/sign_up_screen.dart';
import 'package:quitanda/src/pages/base/base_screen.dart';
import 'package:quitanda/src/pages/base/binding/navigation_binding.dart';
import 'package:quitanda/src/pages/cart/binding/cart_binding.dart';
import 'package:quitanda/src/pages/home/binding/home_binding.dart';
import 'package:quitanda/src/pages/orders/binding/orders_binding.dart';
import 'package:quitanda/src/pages/product/product_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    //
    //Rota para a SignIn
    GetPage(name: PagesRoutes.signInRoute, page: () => SignInScreen()),

    //Rota para a SignUp
    GetPage(name: PagesRoutes.signUpRoute, page: () => SignUpScreen()),

    //Rota para a base, neste momento eu injeto através do HomeBinding a injeção de depedência do HomeController
    //e da NavigationController através da NavigationBinding.
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => BaseScreen(),
      bindings: [
        HomeBinding(),
        NavigationBinding(),
        CartBinding(),
        OrdersBinding(),
      ],
    ),

    //Rota para a tela de produto detalhado
    GetPage(name: PagesRoutes.productRoute, page: () => ProductScreen())
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String baseRoute = '/';
  static const String productRoute = '/product';
}
