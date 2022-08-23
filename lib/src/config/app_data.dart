import 'package:quitanda/src/models/cart/cart_item_model.dart';
import 'package:quitanda/src/models/item/item_model.dart';
import 'package:quitanda/src/models/order/order_model.dart';
import 'package:quitanda/src/models/user/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais'
];

List<CartItemModel> cartItems = [
  CartItemModel(id: '', item: apple, quantity: 1),
  CartItemModel(id: '', item: grape, quantity: 3),
  CartItemModel(id: '', item: guava, quantity: 4),
  CartItemModel(id: '', item: kiwi, quantity: 5),
];

UserModel user = UserModel(
  email: 'matheusjf@gmail.com',
  name: 'Matheus José Ferreira Toledo',
  phone: '(99) 9 9999-9999',
  cpf: '999.999.999-99',
  password: 'matheus',
);

List<OrderModel> orders = [
  // Pedido 01
  OrderModel(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2023-06-08 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2023-06-08 11:00:10.458',
    ),
    id: 'asd6a54da6s2d1',
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartItemModel(
        id: '',
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        id: '',
        item: mango,
        quantity: 2,
      ),
    ],
    qrCodeImage:
        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOQAAADkCAYAAACIV4iNAAAAAklEQVR4AewaftIAAAwpSURBVO3BQW4ERxLAQLKh/3+Z62OeCmjMSC4vMsL+wVrrCg9rrWs8rLWu8bDWusbDWusaD2utazysta7xsNa6xsNa6xoPa61rPKy1rvGw1rrGw1rrGg9rrWs8rLWu8bDWusYPH1L5SxWTyknFpHJSMalMFZPKGxWTyknFpDJVTConFZPKv6liUpkqTlSmiknlL1V84mGtdY2HtdY1HtZa1/jhyyq+SeWNipOKE5UTlU+oTBWTyqRyojJVTConFScqn6iYVN5Q+aaKb1L5poe11jUe1lrXeFhrXeOHX6byRsU3qUwVk8pJxaRyUjGpnKj8pooTlaliqphUpooTlaliUpkqTlS+SeWNit/0sNa6xsNa6xoPa61r/PAfVzGp3KRiUnmj4kRlUpkqJpU3VKaKE5W/VPH/5GGtdY2HtdY1HtZa1/jhP07lpOKkYlKZVKaKSeWNikllqphUPqEyVZyoTBUnKicVk8onKv6fPay1rvGw1rrGw1rrGj/8sorfVHGiMlW8UTGpTBVvqEwVb1S8oXKi8ptUpooTlZOKb6q4ycNa6xoPa61rPKy1rvHDl6n8JZWp4g2VqWJSmSomlaliUpkqJpWp4g2VqeITFZPKVHFSMamcqEwVk8qJylRxonKzh7XWNR7WWtd4WGtdw/7B/xGVqeI3qUwVJyqfqHhD5Y2KN1SmiknlpOJE5aTi/8nDWusaD2utazysta7xw4dUpooTlb+kcrOKE5VJ5ZsqJpWpYlL5RMWkMlW8oXJScaIyVUwqb1R84mGtdY2HtdY1HtZa1/jhQxWTyhsVN1N5Q2WqmComlaniExVvqEwVv0nlExWTylRxovJGxaQyVXzTw1rrGg9rrWs8rLWu8cOXVZyonKi8UTGpTBWTyknFScWk8obKb1KZKiaVT1RMKicVk8qJylQxqUwVJypTxYnKVHGiMlV84mGtdY2HtdY1HtZa1/jhj1W8UTGp/CaVE5VPVJyonFR8U8WkMlWcVJyoTBUnKicVk8pfqphUvulhrXWNh7XWNR7WWtewf/ABlaliUpkqTlQ+UTGpvFExqZxUvKHyTRWTyhsVk8pJxYnKGxUnKr+pYlJ5o+KbHtZa13hYa13jYa11jR++TOVE5aTiDZVJZaqYVN6oeEPlpOJE5ZsqJpXfVHGiMqmcVJyonFScqEwVb6hMFZ94WGtd42GtdY2HtdY1fvhQxaRyUnGi8pcqJpWpYlI5qZhUJpU3Kt6omFROVKaKT6i8UfFNFZPKScWJylTxmx7WWtd4WGtd42GtdY0fvqzimyomlaliUjmpOKk4qZhUJpWpYlKZKiaVN1SmiqniRGVSmSreqJhUpooTlTcqvknl3/Sw1rrGw1rrGg9rrWv88MdUpooTlTcqJpWTihOVqWKqmFQmlb+kMlV8k8pUcVJxonJS8YbKScVJxYnKb3pYa13jYa11jYe11jV++DKVb6qYVN6o+CaVNypOVKaKb1KZKqaK36QyVZxUvKFyUvEJlaniNz2sta7xsNa6xsNa6xr2D75IZao4UZkqJpU3KiaVqeJE5aRiUpkqJpWp4kTlExWTylRxovJfUvEJlaniRGWq+KaHtdY1HtZa13hYa13jh8uoTBUnKpPKVDGpnFRMKpPKVDGpTBUnKlPFicobFZPKScWk8kbFGypvVEwqb1R8k8pU8YmHtdY1HtZa13hYa13jhw+pTBWTyhsVk8pUcVIxqUwV36RyonJS8UbFico3VZyovKEyVUwqU8Wk8gmVqWJSmSr+0sNa6xoPa61rPKy1rmH/4ItUpooTlZOKT6hMFZPKVPGGylTxCZVvqjhRmSomlU9UnKi8UTGpTBUnKicVk8pUMalMFZ94WGtd42GtdY2HtdY17B98QOUmFW+onFS8oTJVTCo3qThRmSomlaliUpkqTlROKiaVf1PFNz2sta7xsNa6xsNa6xr2D/5FKlPFGyrfVDGpfKJiUpkqJpWTijdUblLxTSpTxRsqU8UbKlPFJx7WWtd4WGtd42GtdY0fPqQyVUwqn1CZKt6oeENlqphUpooTlanim1Smik9UTConFW+onFRMKp9QmSpu9rDWusbDWusaD2uta/zwZSonFZPKScUnVD6h8k0q31TxiYqTik+onFRMKlPFicpJxRsqU8WkMlV808Na6xoPa61rPKy1rmH/4AMqU8UbKt9UMamcVLyhMlVMKlPFicpUMancpOITKicVk8pfqphUporf9LDWusbDWusaD2uta/zwx1ROKk5UpopJZar4N6m8oXJS8YbKScUbKicVk8pJxaRyUjGp/KaKv/Sw1rrGw1rrGg9rrWv88McqTlROKj6hMlWcqJyo/KaKSeWk4hMqU8VUMam8UXFSMamcVEwqU8Wk8gmVk4pPPKy1rvGw1rrGw1rrGj98qOJEZaqYVKaKE5Wp4kRlqphUTiomlU9UvKEyVXyTyjepnKhMFZPKVHGiMlX8lz2sta7xsNa6xsNa6xo/fEhlqjhROVE5qZhU3lCZKiaVSWWqeEPlRGWqOFGZKiaVNyomlUllqjipmFQ+oTJVvKFyUjGpTBV/6WGtdY2HtdY1HtZa1/jhX1bxTRWTyonKVHGiMlWcVEwqv6niROWkYlKZVKaKSeWkYlL5SxWTyk0e1lrXeFhrXeNhrXWNHy6nMlVMFZPKVDGpTBUnKm+ofELlpGJSOak4UXmj4o2Kk4pJZap4Q2WqOKmYVP5ND2utazysta7xsNa6xg8fqjipOFE5qThRmSq+qWJSmVSmihOVk4p/U8Wk8kbFpHJSMVV8omJSmSreUJkqJpVvelhrXeNhrXWNh7XWNX74MpU3Kk5Upoqp4kRlqphUfpPKScWkMlVMKlPFicpJxRsqU8WkclLxCZUTlaliUnmjYlL5TQ9rrWs8rLWu8bDWuob9gw+onFRMKlPFpDJVfJPKGxWTylQxqXyi4g2VqeJE5aRiUpkqJpVPVEwqU8Wk8k0VJyonFd/0sNa6xsNa6xoPa61r/PBlFScVk8qJyknFpPJNKlPFpHJS8YbKVPGGyknFpPJNFScqJxUnFZPKVDGpTBUnKicVv+lhrXWNh7XWNR7WWtf44UMVk8pJxVTxCZWTihOVN1SmiknlROU3VZyovFFxUnGiMlVMKlPFpHJSMalMFZPKVHFSMamcVHziYa11jYe11jUe1lrX+OGXVbyhclJxUjGpfKJiUplUPlFxojJVnKhMFVPFpDKpTBUnKlPFVHFS8U0Vk8pUcVLxRsU3Pay1rvGw1rrGw1rrGj/8MpWTiqniN1VMKm9UfKJiUjmpOKmYVE5Upoo3VD6h8ptUpooTlaliUpkqJpWp4hMPa61rPKy1rvGw1rrGDx9SeaPiDZWTikllqviEyhsVk8obFZPKJ1Q+oTJVTConKicVk8pUMalMKicqv6nimx7WWtd4WGtd42GtdY0fPlTxmypOVKaKE5WpYlKZKr6p4kTlpOINlROVk4pJZar4popJZaqYVKaKN1QmlX/Tw1rrGg9rrWs8rLWu8cOHVP5SxYnKVDFVTCpTxYnKVDGpnKh8k8pU8UbFico3VUwqU8VUMam8oTJVnFRMKpPKVPFND2utazysta7xsNa6xg9fVvFNKm9UnKhMFZ9QmSo+ofJGxSdUpoqTikllqpgq3lA5qZhUTir+Sx7WWtd4WGtd42GtdY0ffpnKGxWfUJkqpooTlanim1SmiqliUplUvqnipGJSOVE5qZgq3lA5UflNFZPKVPGJh7XWNR7WWtd4WGtd44f/cypvVJxU/CaVNypOVKaKSWWqOKn4TSonFZPKJypOKv7Sw1rrGg9rrWs8rLWu8cN/XMWJyknFpPJNFVPFGxWTyonKicqJyicqTlS+qWJSOamYVKaKSeUvPay1rvGw1rrGw1rrGj/8sop/U8Wk8omKSeVE5S9VvKEyVXxCZap4o+INlaniEypTxYnKNz2sta7xsNa6xsNa6xr2Dz6g8pcqJpWTihOVT1RMKlPFpHJSMam8UTGpTBUnKlPFpHJScaLyiYoTlaliUpkqJpWpYlI5qfjEw1rrGg9rrWs8rLWuYf9grXWFh7XWNR7WWtd4WGtd42GtdY2HtdY1HtZa13hYa13jYa11jYe11jUe1lrXeFhrXeNhrXWNh7XWNR7WWtd4WGtd4380RIs2ed5qfwAAAABJRU5ErkJggg=="',
  ),

  // // Pedido 02
  // OrderModel(
  //   copyAndPaste: 'q1w2e3r4t5y6',
  //   createdDateTime: DateTime.parse(
  //     '2023-06-08 10:00:10.458',
  //   ),
  //   overdueDateTime: DateTime.parse(
  //     '2023-06-08 11:00:10.458',
  //   ),
  //   id: 'a65s4d6a2s1d6a5s',
  //   status: 'delivered',
  //   total: 11.5,
  //   items: [
  //     CartItemModel(
  //       id: '',
  //       item: guava,
  //       quantity: 1,
  //     ),
  //   ],
  // ),
];
