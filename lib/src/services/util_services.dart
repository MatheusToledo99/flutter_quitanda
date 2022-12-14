import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilsServices {
  //Conversão para valor em R$ (reais)
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return numberFormat.format(price);
  }

  //Data Formatada - Brasil
  String formatDateTime(DateTime dateTime) {
    initializeDateFormatting();
    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }

  //Método para mostrar mensagens de sucesso ou de erro
  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: isError ? Colors.red : Colors.white,
      textColor: isError ? Colors.white : Colors.black,
      fontSize: 14,
    );
  }

  //Método para pegar este QRCode.
  Uint8List decodeQrCodeImage(String value) {
    String base64String = value.split(',').last;

    return base64.decode(base64String);
  }

  //******** VALIDAÇÃO DO TOKEN ********//

  final storage = const FlutterSecureStorage();

  //Isere os dados localmente no momento do LOGIN
  Future<void> saveLocalData(
      {required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  //Recupera o dados salvos localmente
  Future<String?> getLocalData({required String key}) async {
    String? value = await storage.read(key: key);
    return value;
  }

  //Remove os dados em segurança
  Future<void> deleteAllLocalData() async {
    await storage.deleteAll();
  }
  //  await storage.deleteAll();
}
