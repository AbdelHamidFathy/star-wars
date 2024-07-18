import 'package:star_wars/app/apis/end_points.dart';
import 'package:star_wars/app/apis/starships_api.dart';
import 'package:star_wars/app/helper/paginated_response.dart';
import 'package:star_wars/app/models/starship.dart';

class StarshipsRepository {
  final api = StarshipsApi();

  Future<PaginatedResponse<Starship>> fetchStarships(int page) async {
    final url = '${EndPoints.starships}?page=$page';

    try {
      var response = await api.fetchStarships(url: url);
      return PaginatedResponse<Starship>.fromJson(
        response,
        (json) => Starship.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to load starships: $e');
    }
  }
}
