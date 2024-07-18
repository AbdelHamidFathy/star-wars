import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/planets/controller/planets_controller.dart';
import 'package:star_wars/app/modules/planets/widgets/planet_card.dart';
import 'package:star_wars/common/strings.dart';
import 'package:star_wars/common/widgets/pagination.dart';

class PlanetsView extends GetView<PlanetsController> {
  const PlanetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.starWarsPlanets),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.planets.length,
                itemBuilder: (context, index) {
                  var planet = controller.planets[index];
                  return PlanetCard(
                    planet: planet,
                  );
                },
              );
            }),
          ),
          Pagination(
            currentPage: controller.currentPage,
            totalPages: controller.totalPages,
            previousPageUrl: controller.previousPageUrl,
            nextPageUrl: controller.nextPageUrl,
            firstPage: controller.firstPage,
            previousPage: controller.previousPage,
            nextPage: controller.nextPage,
            lastPage: controller.lastPage,
            goToPage: controller.goToPage,
          ),
        ],
      ),
    );
  }
}
