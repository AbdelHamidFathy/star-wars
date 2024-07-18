import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:star_wars/app/modules/vehicles/controller/vehicles_controller.dart';
import 'package:star_wars/app/modules/vehicles/widgets/vehicle_card.dart';
import 'package:star_wars/common/strings.dart';
import 'package:star_wars/common/widgets/pagination.dart';

class VehiclesView extends GetView<VehiclesController> {
  const VehiclesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.starWarsVehicles),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.vehicles.length,
                itemBuilder: (context, index) {
                  var vehicle = controller.vehicles[index];
                  return VehicleCard(
                    vehicle: vehicle,
                  );
                },
              );
            }),
          ),
          Pagination(
            currentPage: controller.currentPage,
            totalPages: controller.totalPages,
            previousPageUrl: controller.previousPageUrl,
            nextPageUrl: controller.nextPageUrl,
            firstPage: controller.firstPage,
            previousPage: controller.previousPage,
            nextPage: controller.nextPage,
            lastPage: controller.lastPage,
            goToPage: controller.goToPage,
          ),
        ],
      ),
    );
  }
}
