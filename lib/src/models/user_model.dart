// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? token;
  String? email;
  String? name;
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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel(id: $id, token: $token, email: $email, name: $name, phone: $phone, cpf: $cpf, password: $password)';
  }
}
