import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/home/widgets/category_card.dart';
import 'package:star_wars/app/routes/app_routes.dart';
import 'package:star_wars/common/strings.dart';

class HomeController extends GetxController {
  final List<Category> categories = [
    Category(
        name: Strings.characters.substring(0, Strings.characters.length - 2),
        icon: Icons.person),
    Category(name: Strings.films, icon: Icons.movie),
    Category(name: Strings.species, icon: Icons.pets),
    Category(name: Strings.planets, icon: Icons.public),
    Category(name: Strings.vehicles, icon: Icons.directions_car),
    Category(name: Strings.starships, icon: Icons.airplanemode_active),
  ];

  final List<String> routeName = [
    Routes.charactersScreen,
    Routes.filmsScreen,
    Routes.speciesScreen,
    Routes.planetsScreen,
    Routes.vehiclesScreen,
    Routes.starshipsScreen,
  ];
}
