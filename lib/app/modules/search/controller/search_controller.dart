import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ItemSearchController extends GetxController {
  var searchResults = [].obs;
  var isLoading = false.obs;

  Future<void> search(String query) async {
    if (query.isEmpty) {
      searchResults.clear();
      return;
    }

    isLoading.value = true;

    // List of endpoints to search
    List<String> endpoints = [
      'people',
      'films',
      'species',
      'vehicles',
      'starships',
    ];

    List<dynamic> results = [];

    for (var endpoint in endpoints) {
      final url = 'https://swapi.dev/api/$endpoint/?search=$query';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        results.addAll(jsonResponse['results']);
      }
    }

    searchResults.assignAll(results);
    isLoading.value = false;
  }
}
