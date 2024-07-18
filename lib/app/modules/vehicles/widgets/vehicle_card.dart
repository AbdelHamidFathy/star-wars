import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/models/vehicle.dart';
import 'package:star_wars/app/modules/favorites/controller/favorites_controller.dart';
import 'package:star_wars/common/strings.dart';

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;
  final FavoritesController favoritesController =
      Get.put(FavoritesController());

  VehicleCard({super.key, required this.vehicle});

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
                  vehicle.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Obx(() {
                  return IconButton(
                    icon: Icon(
                      favoritesController.isFavorite(vehicle.name)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (favoritesController.isFavorite(vehicle.name)) {
                        favoritesController.removeFavorite(vehicle.name);
                      } else {
                        favoritesController.addFavorite(vehicle.name);
                      }
                    },
                  );
                }),
              ],
            ),
            const SizedBox(height: 8.0),
            const Divider(),
            const SizedBox(height: 8.0),
            Text('${Strings.model}${vehicle.model}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.manufacturer}${vehicle.manufacturer}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.costInCredits}${vehicle.costInCredits}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.length}${vehicle.length}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.maxSpeed}${vehicle.maxAtmospheringSpeed}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.crew}${vehicle.crew}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.passengers}${vehicle.passengers}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.cargoCapacity}${vehicle.cargoCapacity}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.consumables}${vehicle.consumables}',
                style: const TextStyle(fontSize: 16.0)),
            const SizedBox(height: 4.0),
            Text('${Strings.vehicleClass}${vehicle.vehicleClass}',
                style: const TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
