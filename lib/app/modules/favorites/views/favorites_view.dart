import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/favorites/controller/favorites_controller.dart';
import 'package:star_wars/common/strings.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.favorites),
      ),
      body: Obx(() {
        if (controller.favorites.isEmpty) {
          return const Center(child: Text(Strings.noFavoritesAdded));
        }

        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            var favorite = controller.favorites[index];
            return ListTile(
              title: Text(favorite),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  controller.removeFavorite(favorite);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
