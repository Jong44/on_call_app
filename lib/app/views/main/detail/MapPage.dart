import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:one_call_app/app/config/ColorConfig.dart';
import 'package:one_call_app/app/controllers/main/MapController.dart';
import 'package:one_call_app/app/widgets/CardLokasiMap.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController controller = Get.put(MapController());
    return Scaffold(body: Obx(() {
      if (controller.origin == const LatLng(0, 0)) {
        return const Center(child: CircularProgressIndicator());
      }
      return Stack(
        children: [
          Obx(() {
            return GoogleMap(
              polylines: controller.polyline.value,
              markers: controller.markers,
              initialCameraPosition:
                  CameraPosition(target: controller.origin, zoom: 15),
            );
          }),
          CardLokasiMap(
            locationUser: controller.address.value,
            locationRelawan: controller.address.value,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: 250,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: const BoxDecoration(
                            color: ColorConfig.primaryColor,
                          ),
                          child: const Text(
                            "Aprilian Tanjung is on the way",
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            color: ColorConfig.primaryColor.withOpacity(0.05),
                          ),
                          child: Text(
                            controller.duration.value,
                            maxLines: 2,
                            style: const TextStyle(
                              color: ColorConfig.primaryColor,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/1.jpg"),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Aprilian Tanjung",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Relawan",
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.73,
                                decoration: BoxDecoration(
                                  color:
                                      ColorConfig.primaryColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const TextField(
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: "Type a message",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                  color: ColorConfig.primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      );
    }));
  }
}
