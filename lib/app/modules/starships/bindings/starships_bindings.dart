import 'package:get/get.dart';
import 'package:star_wars/app/modules/starships/controller/starships_controller.dart';

class StarshipsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StarshipsController>(() => StarshipsController());
  }
}
