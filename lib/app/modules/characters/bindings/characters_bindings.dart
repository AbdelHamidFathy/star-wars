import 'package:get/get.dart';
import 'package:star_wars/app/modules/characters/controller/characters_controller.dart';

class CharactersBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharactersController>(() => CharactersController());
  }
}
