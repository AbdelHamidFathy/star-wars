import 'package:get/get.dart';
import 'package:star_wars/app/modules/planets/controller/planets_controller.dart';

class PlanetsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanetsController>(() => PlanetsController());
  }
}
