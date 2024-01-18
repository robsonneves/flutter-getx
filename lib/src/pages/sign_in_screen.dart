import 'package:flutter/material.dart';
import 'package:flutter_getx/src/pages/components/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Expanded(
          child: Container(
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
            child: Column(children: [
              //email
              CustomTextFild(
                icon: Icons.email,
                label: 'email',
              ),
              // senha
              CustomTextFild(
                icon: Icons.lock,
                label: 'senha',
                isSecret: true,
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
