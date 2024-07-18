import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/characters/controller/characters_controller.dart';
import 'package:star_wars/app/modules/characters/widgets/character_card.dart';
import 'package:star_wars/common/strings.dart';
import 'package:star_wars/common/widgets/pagination.dart';

class CharactersView extends GetView<CharactersController> {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.starWarsCharacters),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.characters.length,
                itemBuilder: (context, index) {
                  var character = controller.characters[index];
                  return CharacterCard(
                    character: character,
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
