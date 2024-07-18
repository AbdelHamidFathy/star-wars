import 'package:get/get.dart';
import 'package:star_wars/app/modules/search/controller/search_controller.dart';

class SearchBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemSearchController>(() => ItemSearchController());
  }
}
