import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/src/pages/auth/view/components/forgot_password_dialog.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda/src/pages_routes/app_pages.dart';
import 'package:quitanda/src/services/util_services.dart';
import 'package:quitanda/src/services/validators.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    final double alturaTela = MediaQuery.of(context).size.height;
    final double larguraTela = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: alturaTela,
          width: larguraTela,
          child: Column(
            children: [
              //Container da Imagem
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //
                    //Nome do App
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Quitanda',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Toledo',
                          style: TextStyle(
                            fontSize: 40,
                            color: CustomColors.customContrastColor,
                          ),
                        ),
                      ],
                    ),

                    //Categorias
                    SizedBox(
                      height: 50,
                      child: DefaultTextStyle(
                        style:
                            const TextStyle(fontSize: 25, color: Colors.white),
                        child: AnimatedTextKit(
                          pause: Duration.zero,
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText('Frutas'),
                            FadeAnimatedText('Carnes'),
                            FadeAnimatedText('Vegetais'),
                            FadeAnimatedText('Cereais'),
                            FadeAnimatedText('Bebidas'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Container de Login ou Cadastro
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30.0),
                  ),
                ),

                //Formulário
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // entrada de texto para email
                      CustomTextField(
                        controller: emailController,
                        label: 'Email',
                        icon: Icons.email,
                        validator: emailValidator,
                      ),

                      //entrada de texto para senha
                      CustomTextField(
                        controller: passwordController,
                        label: 'Senha',
                        icon: Icons.lock,
                        isPassword: true,
                        validator: passwordValidator,
                      ),

                      // Botao de Entrar
                      SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authController) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      //
                                      //Fechar teclado
                                      FocusScope.of(context).unfocus();

                                      if (_formKey.currentState!.validate()) {
                                        String email = emailController.text;
                                        String password =
                                            passwordController.text;

                                        authController.signInController(
                                            email: email, password: password);

                                        //
                                        //
                                      }
                                    },
                              child: authController.isLoading.value
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text('Entrar',
                                      style: TextStyle(fontSize: 18.0)),
                            );
                          },
                        ),
                      ),

                      //Botao de Esqueci minha Conta
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () async {
                              final bool? result = await showDialog(
                                context: context,
                                builder: (context) => ForgotPasswordDialog(
                                    email: emailController.text),
                              );

                              if (result ?? false) {
                                utilsServices.showToast(
                                    message:
                                        "Link de recuperação enviado para o email");
                              }
                            },
                            child: Text(
                              'Esqueci minha senha!',
                              style: TextStyle(
                                  color: CustomColors.customContrastColor,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),

                      //Divisor entre Botao de Entrar e Criar Conta
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey.shade500)),
                          const Text('Ou'),
                          Expanded(child: Divider(color: Colors.grey.shade500)),
                        ],
                      ),

                      //Botao de Criar Conta
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 2, color: Colors.green),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed(PagesRoutes.signUpRoute);
                            },
                            child: const Text(
                              'Criar Conta',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
