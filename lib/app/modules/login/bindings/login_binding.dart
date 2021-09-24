import 'package:get/get.dart';
import 'package:poi_poi_todo/app/modules/home/controllers/home_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
