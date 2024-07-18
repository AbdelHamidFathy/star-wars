import 'package:get/get.dart';
import 'package:star_wars/app/helper/api/api_helper.dart';

class FilmsApi {
  APIHelper apiHelper = APIHelper();

  Future fetchFilms({required String url}) async {
    Get.log("=========== fetchFilms url : $url====================");
    return await apiHelper.getDataRequest(
      url: url,
    );
  }
}
