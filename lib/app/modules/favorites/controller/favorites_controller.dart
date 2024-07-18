import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavoritesController extends GetxController {
  final box = GetStorage();
  var favorites = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() {
    List<dynamic> storedFavorites = box.read<List<dynamic>>('favorites') ?? [];
    favorites.addAll(storedFavorites.cast<String>());
  }

  void addFavorite(String item) {
    if (!favorites.contains(item)) {
      favorites.add(item);
      box.write('favorites', favorites.toList());
    }
  }

  void removeFavorite(String item) {
    favorites.remove(item);
    box.write('favorites', favorites.toList());
  }

  bool isFavorite(String item) {
    return favorites.contains(item);
  }
}
