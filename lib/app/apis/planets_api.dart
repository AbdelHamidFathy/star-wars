import 'package:get/get.dart';
import 'package:star_wars/app/helper/api/api_helper.dart';

class PlanetsApi {
  APIHelper apiHelper = APIHelper();

  Future fetchPlanets({required String url}) async {
    Get.log("=========== fetchPlanets url : $url====================");
    return await apiHelper.getDataRequest(
      url: url,
    );
  }
}
