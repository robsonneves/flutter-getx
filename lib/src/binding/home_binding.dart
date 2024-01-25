import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBiding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController);
  }
}
