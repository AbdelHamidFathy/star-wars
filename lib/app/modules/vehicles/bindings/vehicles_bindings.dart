import 'package:get/get.dart';
import 'package:star_wars/app/modules/vehicles/controller/vehicles_controller.dart';

class VehiclesBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VehiclesController>(() => VehiclesController());
  }
}
