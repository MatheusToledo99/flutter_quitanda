import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';
import 'package:quitanda/src/services/validators.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cpfController = TextEditingController();

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
          child: Stack(
            children: [
              Column(
                children: [
                  //Container da Imagem
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Cadastro',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  //Container de Login ou Cadastro
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.0),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // entrada de texto para email
                          CustomTextField(
                            label: 'Email',
                            icon: Icons.email,
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
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

                          //entrada de texto para nome
                          CustomTextField(
                            controller: nameController,
                            label: 'Nome',
                            icon: Icons.person,
                            validator: nameValidator,
                          ),

                          //entrada de texto para celular
                          CustomTextField(
                            controller: phoneController,
                            label: 'Celular',
                            icon: Icons.phone,
                            inputFormatters: [phoneFormatter],
                            textInputType: TextInputType.phone,
                            validator: phoneValidator,
                          ),

                          //entrada de texto para CPF
                          CustomTextField(
                            controller: cpfController,
                            label: 'CPF',
                            icon: Icons.file_copy,
                            inputFormatters: [cpfFormatter],
                            textInputType: TextInputType.number,
                            validator: cpfValidator,
                          ),

                          //Botao de Criar Conta
                          SizedBox(
                            height: 50,
                            child:
                                // GetX<AuthController>(
                                //   builder: (authController) { return
                                ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  String email = emailController.text;
                                  String password = passwordController.text;
                                  String name = nameController.text;
                                  String phone = phoneController.text;
                                  String cpf = cpfController.text;

                                  // authController.signUpController(
                                  //   email: email,
                                  //   name: name,
                                  //   phone: phone,
                                  //   cpf: cpf,
                                  //   password: password,
                                  // );
                                }
                              },
                              child: const Text('Cadastrar Usuário',
                                  style: TextStyle(fontSize: 18.0)),
                            ),
                            // ;
                            //   },
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
