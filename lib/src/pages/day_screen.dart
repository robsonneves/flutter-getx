import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DayScreen extends StatelessWidget {
  const DayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //DateTime day = Get.parameters['day'];

    print(Get.parameters['day']);

    return const Scaffold();
  }
}
