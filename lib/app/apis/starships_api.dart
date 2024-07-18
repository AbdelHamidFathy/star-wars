import 'package:get/get.dart';
import 'package:star_wars/app/helper/api/api_helper.dart';

class StarshipsApi {
  APIHelper apiHelper = APIHelper();

  Future fetchStarships({required String url}) async {
    Get.log("=========== fetchStarships url : $url====================");
    return await apiHelper.getDataRequest(
      url: url,
    );
  }
}
