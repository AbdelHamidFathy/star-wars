import 'package:get/get.dart';
import 'package:star_wars/app/modules/characters/bindings/characters_bindings.dart';
import 'package:star_wars/app/modules/characters/views/characters_view.dart';
import 'package:star_wars/app/modules/favorites/bindings/favorites_bindings.dart';
import 'package:star_wars/app/modules/favorites/views/favorites_view.dart';
import 'package:star_wars/app/modules/films/bindings/films_bindings.dart';
import 'package:star_wars/app/modules/films/views/films_view.dart';
import 'package:star_wars/app/modules/home/bindings/home_bindings.dart';
import 'package:star_wars/app/modules/home/views/home_view.dart';
import 'package:star_wars/app/modules/planets/bindings/planets_bindings.dart';
import 'package:star_wars/app/modules/planets/views/planets_view.dart';
import 'package:star_wars/app/modules/search/bindings/search_bindings.dart';
import 'package:star_wars/app/modules/search/view/search_view.dart';
import 'package:star_wars/app/modules/species/bindings/species_bindings.dart';
import 'package:star_wars/app/modules/species/views/species_view.dart';
import 'package:star_wars/app/modules/starships/bindings/starships_bindings.dart';
import 'package:star_wars/app/modules/starships/views/starships_view.dart';
import 'package:star_wars/app/modules/vehicles/bindings/vehicles_bindings.dart';
import 'package:star_wars/app/modules/vehicles/views/vehicles_view.dart';

import 'app_routes.dart';

class ThemeAppPages {
  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeView(),
      binding: HomeBindings(),
      transition: Transition.zoom,
    ),
    GetPage(
      name: Routes.planetsScreen,
      page: () => const PlanetsView(),
      binding: PlanetsBindings(),
    ),
    GetPage(
      name: Routes.charactersScreen,
      page: () => const CharactersView(),
      binding: CharactersBindings(),
    ),
    GetPage(
      name: Routes.filmsScreen,
      page: () => const FilmsView(),
      binding: FilmsBindings(),
    ),
    GetPage(
      name: Routes.speciesScreen,
      page: () => const SpeciesView(),
      binding: SpeciesBindings(),
    ),
    GetPage(
      name: Routes.vehiclesScreen,
      page: () => const VehiclesView(),
      binding: VehiclesBindings(),
    ),
    GetPage(
      name: Routes.starshipsScreen,
      page: () => const StarshipsView(),
      binding: StarshipsBindings(),
    ),
    GetPage(
      name: Routes.searchScreen,
      page: () => const SearchView(),
      binding: SearchBindings(),
    ),
    GetPage(
      name: Routes.favoritesScreen,
      page: () => const FavoritesView(),
      binding: FavoritesBindings(),
    ),
  ];
}
