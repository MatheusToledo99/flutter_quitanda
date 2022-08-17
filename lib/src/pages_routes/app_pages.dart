import 'package:get/get.dart';
import 'package:quitanda/src/pages/auth/view/sign_in_screen.dart';
import 'package:quitanda/src/pages/auth/view/sign_up_screen.dart';
import 'package:quitanda/src/pages/base/base_screen.dart';
import 'package:quitanda/src/pages/home/binding/binding.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    //
    //Rota para a SignIn
    GetPage(name: PagesRoutes.signInRoute, page: () => SignInScreen()),

    //Rota para a SignUp
    GetPage(name: PagesRoutes.signUpRoute, page: () => SignUpScreen()),

    //Rota para a base, neste momento eu injeto através do HomeBinding a injeção de depedência do HomeController.
    GetPage(
      name: PagesRoutes.baseRoute,
      page: () => const BaseScreen(),
      bindings: [HomeBinding()],
    ),
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String baseRoute = '/';
}
