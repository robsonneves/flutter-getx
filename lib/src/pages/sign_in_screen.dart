import 'package:flutter/material.dart';
import 'package:flutter_getx/src/controllers/auth_controller.dart';
import 'package:flutter_getx/src/pages/components/custom_text_field.dart';
import 'package:flutter_getx/src/routes/routes.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _formatKey = GlobalKey<FormState>();

  //controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            child: Column(children: [
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                          style: TextStyle(
                            fontSize: 25,
                          ),
                          children: [
                            TextSpan(
                              text: 'Voucher',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'PRO',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),

              // Formulario
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
                        //email
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
                        // senha
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

                        // btn entrar
                        SizedBox(
                          height: 50,
                          child: GetX<AuthController>(
                            builder: (authController) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                onPressed: authController.isLoading.value
                                    ? null
                                    : () {
                                        FocusScope.of(context).unfocus();
                                        if (_formatKey.currentState!
                                            .validate()) {
                                          String email = emailController.text;
                                          String password =
                                              passwordController.text;
                                          authController.signIn(
                                            email: email,
                                            password: password,
                                          );
                                        } else {}
                                        //Get.toNamed(PagesRoutes.baseRoute);
                                      },
                                child: authController.isLoading.value
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        'Entrar',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      ),
                              );
                            },
                          ),
                        ),

                        // Esqueceu senha
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Esqueceu a senha !',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),

                        // Divisor
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Text('Ou'),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.grey.withAlpha(90),
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // BTN Criar conta
                        SizedBox(
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                side: const BorderSide(
                                  width: 2,
                                  color: Colors.green,
                                )),
                            onPressed: () {
                              Get.toNamed(PagesRoutes.signupRoute);
                            },
                            child: const Text(
                              'Criar Conta',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
