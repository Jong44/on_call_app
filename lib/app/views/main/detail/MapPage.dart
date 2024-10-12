import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:one_call_app/app/controllers/main/MapController.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.put(MapController());
    return Scaffold(body: Obx(() {
      if (controller.currentPosition.value == const LatLng(0, 0)) {
        return const Center(child: CircularProgressIndicator());
      }
      return GoogleMap(
        markers: controller.markers,
        initialCameraPosition:
            CameraPosition(target: controller.currentPosition.value, zoom: 15),
      );
    }));
  }
}
