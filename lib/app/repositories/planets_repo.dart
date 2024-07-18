import 'package:star_wars/app/apis/end_points.dart';
import 'package:star_wars/app/apis/planets_api.dart';
import 'package:star_wars/app/helper/paginated_response.dart';
import 'package:star_wars/app/models/planet.dart';

class PlanetRepository {
  final api = PlanetsApi();

  Future<PaginatedResponse<Planet>> fetchPlanets(int page) async {
    final url = '${EndPoints.planets}?page=$page';

    try {
      var response = await api.fetchPlanets(url: url);
      return PaginatedResponse<Planet>.fromJson(
        response,
        (json) => Planet.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to load planets: $e');
    }
  }
}
