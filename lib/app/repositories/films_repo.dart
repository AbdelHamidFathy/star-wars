import 'package:star_wars/app/apis/end_points.dart';
import 'package:star_wars/app/apis/films_api.dart';
import 'package:star_wars/app/helper/paginated_response.dart';
import 'package:star_wars/app/models/film.dart';

class FilmsRepo {
  final api = FilmsApi();

  Future<PaginatedResponse<Film>> fetchFilms(int page) async {
    final url = '${EndPoints.films}?page=$page';

    try {
      var response = await api.fetchFilms(url: url);
      return PaginatedResponse<Film>.fromJson(
        response,
        (json) => Film.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to load films: $e');
    }
  }
}
