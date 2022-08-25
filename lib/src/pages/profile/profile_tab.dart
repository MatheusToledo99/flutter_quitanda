// ignore_for_file: library_prefixes

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:quitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda/src/services/util_services.dart';
import 'package:quitanda/src/services/validators.dart';

class ProfileTab extends StatelessWidget {
  ProfileTab({Key? key}) : super(key: key);
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
            initialValue: authController.user.email,
            readOnly: true,
            label: 'Email',
            icon: Icons.email,
          ),
          CustomTextField(
            initialValue: authController.user.name,
            readOnly: true,
            label: 'Nome',
            icon: Icons.person,
          ),
          CustomTextField(
            initialValue: authController.user.phone,
            readOnly: true,
            label: 'Celular',
            icon: Icons.phone,
          ),
          CustomTextField(
            initialValue: authController.user.cpf,
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
                await updatePassword(context);
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
  Future<bool?> updatePassword(BuildContext context) {
    final TextEditingController newPassword = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();
    final TextEditingController currentPassword = TextEditingController();
    final utilsServices = UtilsServices();

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
                      controller: currentPassword,
                      label: 'Senha Atual',
                      icon: Icons.lock,
                      isPassword: true,
                      validator: passwordValidator,
                    ),

                    //Nova Senha
                    CustomTextField(
                      controller: newPassword,
                      label: 'Nova Senha',
                      icon: Icons.lock_outline,
                      isPassword: true,
                      validator: passwordValidator,
                    ),

                    //Confirmação de Senha
                    CustomTextField(
                      controller: confirmPassword,
                      label: 'Confirmação de Senha',
                      icon: Icons.lock_outline,
                      isPassword: true,
                      validator: passwordValidator,
                    ),

                    //Botao de Atualização
                    SizedBox(
                      height: 50,
                      child: Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                          onPressed: authController.isLoading.value
                              ? null
                              : () {
                                  if (confirmPassword.text ==
                                      newPassword.text) {
                                    authController.changePasswordController(
                                        newPassword: newPassword.text,
                                        currentPassword: currentPassword.text);
                                  } else {
                                    utilsServices.showToast(
                                      message: 'Senhas não equivalentes',
                                      isError: true,
                                    );
                                  }
                                },
                          child: authController.isLoading.value
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'Atualizar',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                        ),
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
