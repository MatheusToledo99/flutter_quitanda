// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:quitanda/src/config/app_data.dart' as appData;
import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do usuário'),
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),

      //ListView contendo os TextsField de Email, Nome, Celular e CPF
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          CustomTextField(
            initialValue: appData.user.email,
            readOnly: true,
            label: 'Email',
            icon: Icons.email,
          ),
          CustomTextField(
            initialValue: appData.user.name,
            readOnly: true,
            label: 'Nome',
            icon: Icons.person,
          ),
          CustomTextField(
            initialValue: appData.user.phone,
            readOnly: true,
            label: 'Celular',
            icon: Icons.phone,
          ),
          CustomTextField(
            initialValue: appData.user.cpf,
            readOnly: true,
            label: 'CPF',
            icon: Icons.file_copy,
            isPassword: true,
          ),
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 2, color: Colors.green),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              onPressed: () async {
                await updatePassword();
              },
              child: const Text(
                'Atualizar senha',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Função para Atualizar Senha
  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            children: [
              //Informações
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Text(
                        'Atualização de Senha ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //Senha Atual
                    CustomTextField(
                      initialValue: appData.user.password,
                      readOnly: true,
                      label: 'Senha Atual',
                      icon: Icons.lock,
                      isPassword: true,
                    ),

                    //Nova Senha
                    const CustomTextField(
                      label: 'Nova Senha',
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),

                    //Confirmação de Senha
                    const CustomTextField(
                      label: 'Confirmação de Senha',
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),

                    //Botao de Atualização
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Atualizar',
                            style: TextStyle(fontSize: 18.0)),
                      ),
                    ),
                  ],
                ),
              ),

              //Botao de Fechar
              Positioned(
                right: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
