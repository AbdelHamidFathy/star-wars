import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/search/controller/search_controller.dart';
import 'package:star_wars/common/strings.dart';

class SearchView extends GetView<ItemSearchController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.searchStarWarsUniverse),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                controller.search(value);
              },
              decoration: const InputDecoration(
                labelText: Strings.search,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.searchResults.isEmpty) {
                  return const Center(child: Text(Strings.noResultsFound));
                }

                return ListView.builder(
                  itemCount: controller.searchResults.length,
                  itemBuilder: (context, index) {
                    var result = controller.searchResults[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        title: Text(
                          result[Strings.name] ??
                              result[Strings.title] ??
                              Strings.unknown,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle:
                            Text('${Strings.category}${_getCategory(result)}'),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  String _getCategory(Map<String, dynamic> result) {
    if (result.containsKey('height')) return 'Character';
    if (result.containsKey('episode_id')) return 'Film';
    if (result.containsKey('classification')) return 'Species';
    if (result.containsKey('model') && result.containsKey('starship_class')) {
      return 'Starship';
    }
    if (result.containsKey('model')) return 'Vehicle';
    return 'Unknown';
  }
}
