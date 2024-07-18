import 'package:get/get.dart';
import 'package:star_wars/app/modules/films/controller/films_controller.dart';

class FilmsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilmsController>(() => FilmsController());
  }
}
