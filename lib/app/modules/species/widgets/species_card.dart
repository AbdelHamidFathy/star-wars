import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/models/species.dart';
import 'package:star_wars/app/modules/favorites/controller/favorites_controller.dart';
import 'package:star_wars/common/strings.dart';

class SpeciesCard extends StatelessWidget {
  final Species species;
  final FavoritesController favoritesController =
      Get.put(FavoritesController());

  SpeciesCard({super.key, required this.species});

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
                  species.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Obx(() {
                  return IconButton(
                    icon: Icon(
                      favoritesController.isFavorite(species.name)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (favoritesController.isFavorite(species.name)) {
                        favoritesController.removeFavorite(species.name);
                      } else {
                        favoritesController.addFavorite(species.name);
                      }
                    },
                  );
                }),
              ],
            ),
            const SizedBox(height: 8.0),
            const Divider(),
            const SizedBox(height: 8.0),
            Text('${Strings.classification}${species.classification}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.designation}${species.designation}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.averageHeight}${species.averageHeight}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.skinColor}${species.skinColors}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.hairColor}${species.hairColors}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.eyeColor}${species.eyeColors}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.averageLifespan}${species.averageLifespan}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.language}${species.language}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.characters}${species.people.length}',
                style: const TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
