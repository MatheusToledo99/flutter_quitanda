// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

//Classe para serealizar o Json, gerando um arquivo, devo apenas citar os métodos toJson e fromJson
//através do retorno de uma factory e um Map<string dynamic>

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String? name;

  String? id;
  String? token;
  String? email;
  String? phone;
  String? cpf;
  String? password;

  UserModel({
    this.id,
    this.token,
    this.email,
    this.name,
    this.phone,
    this.cpf,
    this.password,
  });

// Método para converter Map<String, dynamic> para Json
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

// Método para converter Json para Map<String, dynamic>
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel(id: $id, token: $token, email: $email, name: $name, phone: $phone, cpf: $cpf, password: $password)';
  }
}
