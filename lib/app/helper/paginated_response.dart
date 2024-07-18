class PaginatedResponse<T> {
  List<T> results;
  String? next;
  String? previous;
  int count;

  PaginatedResponse({
    required this.results,
    required this.next,
    required this.previous,
    required this.count,
  });

  factory PaginatedResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return PaginatedResponse<T>(
      results: (json['results'] as List).map(fromJson).toList(),
      next: json['next'],
      previous: json['previous'],
      count: json['count'],
    );
  }
}
