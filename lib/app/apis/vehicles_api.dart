import 'package:get/get.dart';
import 'package:star_wars/app/helper/api/api_helper.dart';

class VehiclesApi {
  APIHelper apiHelper = APIHelper();

  Future fetchVehicles({required String url}) async {
    Get.log("=========== fetchVehicles url : $url====================");
    return await apiHelper.getDataRequest(
      url: url,
    );
  }
}
