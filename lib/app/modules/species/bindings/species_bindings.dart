import 'package:get/get.dart';
import 'package:star_wars/app/modules/species/controller/species_controller.dart';

class SpeciesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeciesController>(() => SpeciesController());
  }
}
