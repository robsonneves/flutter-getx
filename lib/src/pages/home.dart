import 'package:flutter/material.dart';

import '../controllers/value_controller.dart';

class Home extends StatelessWidget {
  final textController = TextEditingController();
  final valueController = ValueController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // txt
            Text('Valor definido ${valueController.defineValue}'),

            // Campo
            TextField(
              controller: textController,
            ),

            // Btn
            ElevatedButton(
              onPressed: () {
                String value = textController.text;
                valueController.defineValue = value;
              },
              child: const Text("Confirmar"),
            ),
          ],
        ),
      ),
    );
  }
}
