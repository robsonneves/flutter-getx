import 'package:flutter/material.dart';
import 'package:flutter_getx/src/routes/routes.dart';
import 'package:get/get.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Btn
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(PagesRoutes.calanderRoute);
                },
                child: const Text("Calendario"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
