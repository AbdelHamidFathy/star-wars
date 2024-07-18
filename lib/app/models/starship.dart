class Starship {
  String name;
  String model;
  String manufacturer;
  String costInCredits;
  String length;
  String maxAtmospheringSpeed;
  String crew;
  String passengers;
  String cargoCapacity;
  String consumables;
  String starshipClass;
  String hyperDriveRating;
  String mglt;

  Starship({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.starshipClass,
    required this.hyperDriveRating,
    required this.mglt,
  });

  factory Starship.fromJson(Map<String, dynamic> json) {
    return Starship(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      costInCredits: json['cost_in_credits'],
      length: json['length'],
      maxAtmospheringSpeed: json['max_atmosphering_speed'],
      crew: json['crew'],
      passengers: json['passengers'],
      cargoCapacity: json['cargo_capacity'],
      consumables: json['consumables'],
      starshipClass: json['starship_class'],
      mglt: json['MGLT'],
      hyperDriveRating: json['hyperdrive_rating'],
    );
  }
}
