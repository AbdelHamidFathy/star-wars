import 'package:get/get.dart';
import 'package:star_wars/app/helper/paginated_response.dart';
import 'dart:math';

import 'package:star_wars/app/models/starship.dart';
import 'package:star_wars/app/repositories/starships_repository.dart';

class StarshipsController extends GetxController {
  var starships = <Starship>[].obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var isLoading = false.obs;
  var nextPageUrl = ''.obs;
  var previousPageUrl = ''.obs;
  final repository = StarshipsRepository();
  final int maxDisplayedPages = 4;

  @override
  void onInit() {
    super.onInit();
    fetchStarships(currentPage.value);
  }

  Future<void> fetchStarships(int page) async {
    isLoading.value = true;

    try {
      PaginatedResponse<Starship> paginatedResponse =
          await repository.fetchStarships(page);

      starships.assignAll(paginatedResponse.results);
      nextPageUrl.value = paginatedResponse.next ?? '';
      previousPageUrl.value = paginatedResponse.previous ?? '';
      // Assuming each page has 10 items
      int itemsPerPage = 10;
      totalPages.value = (paginatedResponse.count / itemsPerPage).ceil();
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages.value) {
      currentPage.value = page;
      fetchStarships(page);
    }
  }

  void nextPage() {
    if (currentPage.value < totalPages.value) {
      goToPage(currentPage.value + 1);
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      goToPage(currentPage.value - 1);
    }
  }

  void firstPage() {
    goToPage(1);
  }

  void lastPage() {
    goToPage(totalPages.value);
  }

  List<int> getDisplayedPages() {
    int startPage = 1;
    int endPage = totalPages.value;

    if (totalPages.value > maxDisplayedPages) {
      if (currentPage.value <= 3) {
        endPage = maxDisplayedPages;
      } else if (currentPage.value + 2 >= totalPages.value) {
        startPage = totalPages.value - maxDisplayedPages + 1;
        endPage = totalPages.value;
      } else {
        startPage = currentPage.value - 2;
        endPage = currentPage.value + 2;
      }
    }
    endPage = min(endPage, totalPages.value);

    return List<int>.generate(
        endPage - startPage + 1, (index) => startPage + index);
  }
}
