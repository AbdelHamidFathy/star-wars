import 'package:star_wars/app/apis/end_points.dart';
import 'package:star_wars/app/apis/species_api.dart';
import 'package:star_wars/app/helper/paginated_response.dart';
import 'package:star_wars/app/models/species.dart';

class SpeciesRepository {
  final api = SpeciesApi();

  Future<PaginatedResponse<Species>> fetchSpecies(int page) async {
    final url = '${EndPoints.species}?page=$page';

    try {
      var response = await api.fetchSpecies(url: url);
      return PaginatedResponse<Species>.fromJson(
        response,
        (json) => Species.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to load species: $e');
    }
  }
}
