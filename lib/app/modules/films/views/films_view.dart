import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/films/controller/films_controller.dart';
import 'package:star_wars/app/modules/films/widgets/film_card.dart';
import 'package:star_wars/common/strings.dart';
import 'package:star_wars/common/widgets/pagination.dart';

class FilmsView extends GetView<FilmsController> {
  const FilmsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.starWarsFilms),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.films.length,
                itemBuilder: (context, index) {
                  var film = controller.films[index];
                  return FilmCard(
                    film: film,
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
