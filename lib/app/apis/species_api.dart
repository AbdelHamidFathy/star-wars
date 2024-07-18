import 'package:get/get.dart';
import 'package:star_wars/app/helper/api/api_helper.dart';

class SpeciesApi {
  APIHelper apiHelper = APIHelper();

  Future fetchSpecies({required String url}) async {
    Get.log("=========== fetchSpecies url : $url====================");
    return await apiHelper.getDataRequest(
      url: url,
    );
  }
}
