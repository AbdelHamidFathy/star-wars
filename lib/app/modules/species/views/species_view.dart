import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/species/controller/species_controller.dart';
import 'package:star_wars/app/modules/species/widgets/species_card.dart';
import 'package:star_wars/common/strings.dart';
import 'package:star_wars/common/widgets/pagination.dart';

class SpeciesView extends GetView<SpeciesController> {
  const SpeciesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.starWarsSpecies),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.species.length,
                itemBuilder: (context, index) {
                  var specie = controller.species[index];
                  return SpeciesCard(species: specie);
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
