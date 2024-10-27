import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:one_call_app/app/services/MapsService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapController extends GetxController {
  late SharedPreferences prefs;
  late double latitude;
  late double longitude;
  final markers = <Marker>{};
  var polyline = <Polyline>{}.obs;
  var address = ''.obs;
  var distance = ''.obs;
  var duration = ''.obs;
  final LatLng destination = const LatLng(-6.979, 110.411);
  LatLng origin = const LatLng(-6.9822910644331895, 110.40914207075114);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    init();
  }

  void init() async {
    print('init');
    prefs = await SharedPreferences.getInstance();
    // latitude = prefs.getDouble('latitude') ?? 0;
    latitude = origin.latitude;
    // longitude = prefs.getDouble('longitude') ?? 0;
    longitude = origin.longitude;
    address.value = prefs.getString('address') ?? '';
    markers.add(Marker(
      markerId: const MarkerId('user'),
      position: origin,
    ));
    markers.add(Marker(
      markerId: const MarkerId('relawan'),
      position: destination,
    ));
    if (address.value.isNotEmpty) {
      getMapsData();
    }
    print('latitude: $latitude, longitude: $longitude, address: $address');
  }

  void getMapsData() async {
    LatLng origin = const LatLng(-6.9822910644331895, 110.40914207075114);
    final response = await MapsService().getDirections(origin, destination);
    if (response.status == 'success') {
      distance.value = response.data['distance'];
      duration.value = response.data['duration'];
      polyline.add(Polyline(
        polylineId: const PolylineId('1'),
        points: decodePolyline(response.data['polyline']),
        color: Colors.red,
        width: 5,
      ));
      if (distance.value != '' && duration.value != '') {
        Get.offNamed('/emergency-map');
      }
    } else {
      print(response.message);
    }
  }

  List<LatLng> decodePolyline(String polyline) {
    List<LatLng> coordinates = [];
    int index = 0, len = polyline.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      coordinates.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return coordinates;
  }
}
