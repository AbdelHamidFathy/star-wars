// widgets/film_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/models/film.dart';
import 'package:star_wars/app/modules/favorites/controller/favorites_controller.dart';
import 'package:star_wars/common/strings.dart';

class FilmCard extends StatelessWidget {
  final Film film;
  final FavoritesController favoritesController =
      Get.put(FavoritesController());

  FilmCard({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  film.title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Obx(() {
                  return IconButton(
                    icon: Icon(
                      favoritesController.isFavorite(film.title)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (favoritesController.isFavorite(film.title)) {
                        favoritesController.removeFavorite(film.title);
                      } else {
                        favoritesController.addFavorite(film.title);
                      }
                    },
                  );
                }),
              ],
            ),
            const SizedBox(height: 8.0),
            const Divider(),
            const SizedBox(height: 8.0),
            Text('${Strings.director}${film.director}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.producer}${film.producer}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.releaseDate}${film.releaseDate}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.characters}${film.characters.length}',
                style: const TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
