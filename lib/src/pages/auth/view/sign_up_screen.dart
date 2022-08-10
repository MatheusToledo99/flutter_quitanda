import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda/src/config/custom_colors.dart';
import 'package:quitanda/src/pages/common_widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final phoneFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // entrada de texto para email
                        const CustomTextField(
                            label: 'Email', icon: Icons.email),

                        //entrada de texto para senha
                        const CustomTextField(
                            label: 'Senha', icon: Icons.lock, isPassword: true),

                        //entrada de texto para nome
                        const CustomTextField(
                            label: 'Nome', icon: Icons.person),

                        //entrada de texto para celular
                        CustomTextField(
                            label: 'Celular',
                            icon: Icons.phone,
                            inputFormatters: [phoneFormatter]),

                        //entrada de texto para CPF
                        CustomTextField(
                            label: 'CPF',
                            icon: Icons.file_copy,
                            inputFormatters: [cpfFormatter]),

                        //Botao de Criar Conta
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
                            child: const Text('Cadastrar Usuário',
                                style: TextStyle(fontSize: 18.0)),
                          ),
                        ),
                      ],
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
