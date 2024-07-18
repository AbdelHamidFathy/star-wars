// widgets/character_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/models/character.dart';
import 'package:star_wars/app/modules/favorites/controller/favorites_controller.dart';
import 'package:star_wars/common/strings.dart';

class CharacterCard extends StatelessWidget {
  final Character character;
  final FavoritesController favoritesController =
      Get.put(FavoritesController());

  CharacterCard({super.key, required this.character});

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
                  character.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Obx(() {
                  return IconButton(
                    icon: Icon(
                      favoritesController.isFavorite(character.name)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (favoritesController.isFavorite(character.name)) {
                        favoritesController.removeFavorite(character.name);
                      } else {
                        favoritesController.addFavorite(character.name);
                      }
                    },
                  );
                }),
              ],
            ),
            const SizedBox(height: 8.0),
            const Divider(),
            const SizedBox(height: 8.0),
            Text('${Strings.height}${character.height}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.mass}${character.mass}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.skinColor}${character.skinColor}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.hairColor}${character.hairColor}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.eyeColor}${character.eyeColor}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.gender}${character.gender}',
                style: const TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
