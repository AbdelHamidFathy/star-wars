import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/home/controller/home_controller.dart';
import 'package:star_wars/app/modules/home/widgets/category_card.dart';
import 'package:star_wars/app/routes/app_routes.dart';
import 'package:star_wars/common/strings.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.starWarsUniverse),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(Routes.searchScreen),
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => Get.toNamed(Routes.favoritesScreen),
            icon: const Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: controller.categories[index],
              routeName: controller.routeName[index],
            );
          },
        ),
      ),
    );
  }
}
