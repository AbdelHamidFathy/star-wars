import 'package:get/get.dart';
import 'package:star_wars/app/modules/favorites/controller/favorites_controller.dart';

class FavoritesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritesController>(() => FavoritesController());
  }
}
