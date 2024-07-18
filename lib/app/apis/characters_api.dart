import 'package:get/get.dart';
import 'package:star_wars/app/helper/api/api_helper.dart';

class CharactersApi {
  APIHelper apiHelper = APIHelper();

  Future fetchCharacters({required String url}) async {
    Get.log("=========== fetchCharacters url : $url====================");
    return await apiHelper.getDataRequest(
      url: url,
    );
  }
}
