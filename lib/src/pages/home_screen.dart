import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final textController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // txt
            const Text('Valor definido ...'),

            // Campo
            TextField(
              controller: textController,
            ),

            // Btn
            ElevatedButton(
              onPressed: () {
                String value = textController.text;
              },
              child: const Text("Confirmar"),
            ),
          ],
        ),
      ),
    );
  }
}
