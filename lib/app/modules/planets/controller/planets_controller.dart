import 'package:get/get.dart';
import 'package:star_wars/app/helper/paginated_response.dart';
import 'package:star_wars/app/models/planet.dart';
import 'package:star_wars/app/repositories/planets_repo.dart';

class PlanetsController extends GetxController {
  var planets = <Planet>[].obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var isLoading = false.obs;
  var nextPageUrl = ''.obs;
  var previousPageUrl = ''.obs;
  final repository = PlanetRepository();

  @override
  void onInit() {
    super.onInit();
    fetchPlanets(currentPage.value);
  }

  Future<void> fetchPlanets(int page) async {
    isLoading.value = true;

    try {
      PaginatedResponse<Planet> paginatedResponse =
          await repository.fetchPlanets(page);

      planets.assignAll(paginatedResponse.results);
      nextPageUrl.value = paginatedResponse.next ?? '';
      previousPageUrl.value = paginatedResponse.previous ?? '';
      totalPages.value =
          (paginatedResponse.count / paginatedResponse.results.length).ceil();
    } catch (e) {
      throw Exception('Failed to load planets: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void goToPage(int page) {
    currentPage.value = page;
    fetchPlanets(page);
  }

  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      fetchPlanets(currentPage.value);
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      fetchPlanets(currentPage.value);
    }
  }

  void firstPage() {
    currentPage.value = 1;
    fetchPlanets(currentPage.value);
  }

  void lastPage() {
    currentPage.value = totalPages.value;
    fetchPlanets(currentPage.value);
  }
}
