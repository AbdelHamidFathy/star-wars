import 'package:get/get.dart';
import 'package:star_wars/app/modules/home/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
