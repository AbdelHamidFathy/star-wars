import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/starships/controller/starships_controller.dart';
import 'package:star_wars/app/modules/starships/widgets/starship_card.dart';
import 'package:star_wars/common/strings.dart';
import 'package:star_wars/common/widgets/pagination.dart';

class StarshipsView extends GetView<StarshipsController> {
  const StarshipsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.starWarsStarships),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.starships.length,
                itemBuilder: (context, index) {
                  var starship = controller.starships[index];
                  return StarshipCard(
                    starship: starship,
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
