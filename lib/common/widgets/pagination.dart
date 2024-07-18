import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagination extends StatelessWidget {
  final RxInt currentPage;
  final RxInt totalPages;
  final RxString previousPageUrl;
  final RxString nextPageUrl;
  final VoidCallback firstPage;
  final VoidCallback previousPage;
  final VoidCallback nextPage;
  final VoidCallback lastPage;
  final void Function(int) goToPage;
  final int maxDisplayedPages;

  const Pagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.previousPageUrl,
    required this.nextPageUrl,
    required this.firstPage,
    required this.previousPage,
    required this.nextPage,
    required this.lastPage,
    required this.goToPage,
    this.maxDisplayedPages = 5,
  });

  List<int> getDisplayedPages() {
    int startPage = 1;
    int endPage = totalPages.value;

    if (totalPages.value > maxDisplayedPages) {
      startPage = currentPage.value - 2;
      endPage = currentPage.value + 2;

      if (startPage < 1) {
        startPage = 1;
        endPage = maxDisplayedPages;
      } else if (endPage > totalPages.value) {
        endPage = totalPages.value;
        startPage = totalPages.value - maxDisplayedPages + 1;
      }
    }

    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: previousPageUrl.value.isNotEmpty ? firstPage : null,
              icon: const Icon(Icons.first_page),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: previousPageUrl.value.isNotEmpty ? previousPage : null,
            ),
            if (totalPages.value > maxDisplayedPages && currentPage.value > 3)
              const Text('...'),
            for (var i in getDisplayedPages())
              GestureDetector(
                onTap: () => goToPage(i),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    color: currentPage.value == i ? Colors.blue : Colors.grey,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    '$i',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            if (totalPages.value > maxDisplayedPages &&
                currentPage.value + 2 < totalPages.value)
              const Text('...'),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              onPressed: nextPageUrl.value.isNotEmpty ? nextPage : null,
            ),
            IconButton(
              onPressed: nextPageUrl.value.isNotEmpty ? lastPage : null,
              icon: const Icon(Icons.last_page),
            ),
          ],
        );
      }),
    );
  }
}
