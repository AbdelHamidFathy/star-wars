import 'package:star_wars/app/apis/end_points.dart';
import 'package:star_wars/app/apis/vehicles_api.dart';
import 'package:star_wars/app/helper/paginated_response.dart';
import 'package:star_wars/app/models/vehicle.dart';

class VehiclesRepository {
  final api = VehiclesApi();

  Future<PaginatedResponse<Vehicle>> fetchVehicles(int page) async {
    final url = '${EndPoints.vehicles}?page=$page';

    try {
      var response = await api.fetchVehicles(url: url);
      return PaginatedResponse<Vehicle>.fromJson(
        response,
        (json) => Vehicle.fromJson(json),
      );
    } catch (e) {
      throw Exception('Failed to load vehicles: $e');
    }
  }
}
