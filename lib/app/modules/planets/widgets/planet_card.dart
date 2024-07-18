// widgets/planet_card.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/models/planet.dart';
import 'package:star_wars/app/modules/favorites/controller/favorites_controller.dart';
import 'package:star_wars/common/strings.dart';

class PlanetCard extends StatelessWidget {
  final Planet planet;
  final FavoritesController favoritesController =
      Get.put(FavoritesController());

  PlanetCard({super.key, required this.planet});

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
                  planet.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Obx(() {
                  return IconButton(
                    icon: Icon(
                      favoritesController.isFavorite(planet.name)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (favoritesController.isFavorite(planet.name)) {
                        favoritesController.removeFavorite(planet.name);
                      } else {
                        favoritesController.addFavorite(planet.name);
                      }
                    },
                  );
                }),
              ],
            ),
            const SizedBox(height: 8.0),
            const Divider(),
            const SizedBox(height: 8.0),
            Text('${Strings.rotationPeriod}${planet.rotationPeriod}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.orbitalPeriod}${planet.orbitalPeriod}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.diameter}${planet.diameter}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.climate}${planet.climate}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.gravity}${planet.gravity}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.terrain}${planet.terrain}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.surfaceWater}${planet.surfaceWater}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.population}${planet.population}',
                style: const TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
