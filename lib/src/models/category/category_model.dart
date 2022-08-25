// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'package:quitanda/src/models/item/item_model.dart';

part 'category_model.g.dart';

//Classe para serealizar o Json, gerando um arquivo, devo apenas citar os métodos toJson e fromJson
//através do retorno de uma factory e um Map<string dynamic>

@JsonSerializable()
class CategoryModel {
  String title;
  String id;

  @JsonKey(defaultValue: [])
  List<ItemModel> items;

  @JsonKey(defaultValue: 0)
  int pagination;

  CategoryModel({
    required this.title,
    required this.id,
    required this.items,
    required this.pagination,
  });

// Método para converter Map<String, dynamic> para Json
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

// Método para converter Json para Map<String, dynamic>
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  String toString() {
    return 'CategoryModel(title: $title, id: $id, items: $items, pagination: $pagination)';
  }
}
