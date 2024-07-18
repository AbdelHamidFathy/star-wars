import 'package:star_wars/app/apis/characters_api.dart';
import 'package:star_wars/app/apis/end_points.dart';
import 'package:star_wars/app/helper/paginated_response.dart';
import 'package:star_wars/app/models/character.dart';

class CharactersRepo {
  final api = CharactersApi();

  Future<PaginatedResponse<Character>> fetchCharacters(int page) async {
    final url = '${EndPoints.characters}?page=$page';

    try {
      var response = await api.fetchCharacters(url: url);
      return PaginatedResponse<Character>.fromJson(
        response,
        (json) => Character.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }
}
