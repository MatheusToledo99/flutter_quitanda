const String baseUrl = 'https://parseapi.back4app.com/functions';

abstract class Endpoints {
  //

  // LOGIN / OPERAÇÕES DE CADASTRO / SAÍDA
  static const String signin = '$baseUrl/login';
  static const String signup = '$baseUrl/signup';
  static const String changePassword = '$baseUrl/change-password';
  static const String resetPassword = '$baseUrl/reset-password';
  static const String checkout = '$baseUrl/checkout';
  static const String validateToken = '$baseUrl/validate-token';

  // RECUPERAR CATEGORIAS / PRODUTOS
  static const String getCategoryList = '$baseUrl/get-category-list';
  static const String getProductList = '$baseUrl/get-product-list';

  // ADICIONAR / MODIFICAR PRODUTOS AO CARRINHO
  static const String getCartItems = '$baseUrl/get-cart-items';
  static const String addItemToCart = '$baseUrl/add-item-to-cart';
  static const String modifyItemQuantity = '$baseUrl/modify-item-quantity';

  // RECUPERAR OS PEDIDOS E OS ITEMS DOS PEDIDOS
  static const String getOrders = '$baseUrl/get-orders';
  static const String getOrderItems = '$baseUrl/get-order-items';
}
