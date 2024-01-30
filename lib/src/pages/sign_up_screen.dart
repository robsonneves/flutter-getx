import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllers/auth_controller.dart';
import 'package:flutter_getx/src/routes/routes.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'components/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formatKey = GlobalKey<FormState>();

  //controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final cpfController = TextEditingController();

  final cpfFormater = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );

  final phoneFormater = MaskTextInputFormatter(
    mask: '(##)#####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: size.height,
            width: 500,
            child: Stack(
              children: [
                Column(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Cadastro',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),

                    // Formalario
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 40,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        ),
                      ),
                      child: Form(
                        key: _formatKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomTextFild(
                              controller: emailController,
                              icon: Icons.email,
                              label: 'email',
                              validator: (email) {
                                if (email == null || email.isEmpty) {
                                  return 'Digite seu e-mail!';
                                }
                                if (!email.isEmail) {
                                  return 'Digite um e-mail valido!';
                                }
                                return null;
                              },
                            ),
                            CustomTextFild(
                              controller: passwordController,
                              icon: Icons.lock,
                              label: 'senha',
                              isSecret: true,
                              validator: (password) {
                                if (password == null || password.isEmpty) {
                                  return 'Digite sua senha';
                                }
                                if (password.length < 7) {
                                  return 'Digite uma senha com pelo menos 7 caracteres';
                                }
                                return null;
                              },
                            ),
                            CustomTextFild(
                              controller: nameController,
                              icon: Icons.person,
                              label: 'Nome',
                              validator: (name) {
                                if (name == null || name.isEmpty) {
                                  return 'Digite seu Nome';
                                }
                                if (name.length < 3) {
                                  return 'Digite uma Nome com pelo menos 3 caracteres';
                                }
                                return null;
                              },
                            ),
                            CustomTextFild(
                              controller: phoneController,
                              icon: Icons.phone,
                              label: 'Celular',
                              inputFormatters: [phoneFormater],
                            ),
                            CustomTextFild(
                              controller: cpfController,
                              icon: Icons.file_copy,
                              label: 'CPF',
                              inputFormatters: [cpfFormater],
                            ),
                            SizedBox(
                              height: 50,
                              child: GetX<AuthController>(
                                builder: (authController) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18))),
                                    onPressed: authController.isLoading.value
                                        ? null
                                        : () {
                                            FocusScope.of(context).unfocus();
                                            if (_formatKey.currentState!
                                                .validate()) {
                                              String email =
                                                  emailController.text;
                                              String password =
                                                  passwordController.text;
                                              String name = nameController.text;
                                              String phone =
                                                  phoneController.text;
                                              String cpf = cpfController.text;
                                              authController.signUp(
                                                email: email,
                                                password: password,
                                                name: name,
                                                phone: phone,
                                                cpf: cpf,
                                              );
                                            } else {}
                                            //Get.toNamed(PagesRoutes.baseRoute);
                                          },
                                    child: const Text(
                                      'Cadastrar',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  );
                                },
                              ),
                            ),

                            // Ja tenho cadastro
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(PagesRoutes.signinRoute);
                                },
                                child: const Text(
                                  'Já tenho cadastro, entrar !',
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (ResponsiveBreakpoints.of(context).smallerThan(DESKTOP))
                  Column(
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: SafeArea(
                          child: IconButton(
                            onPressed: () {
                              Get.toNamed(PagesRoutes.signinRoute);
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
