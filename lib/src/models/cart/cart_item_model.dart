// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quitanda/src/models/item/item_model.dart';

part 'cart_item_model.g.dart';

//Classe para serealizar o Json, gerando um arquivo, devo apenas citar os métodos toJson e fromJson
//através do retorno de uma factory e um Map<string dynamic>

@JsonSerializable()
class CartItemModel {
  String id;
  @JsonKey(name: 'product')
  ItemModel item;
  int quantity;

  CartItemModel({
    required this.id,
    required this.item,
    required this.quantity,
  });

  // Método para converter Map<String, dynamic> para Json
  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);

  // Método para converter Json para Map<String, dynamic>
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);

  //Calcular o Preço total do carrinho
  double totalPrice() {
    return item.price * quantity;
  }

  @override
  String toString() =>
      'CartItemModel(id: $id, item: $item, quantity: $quantity)';
}
