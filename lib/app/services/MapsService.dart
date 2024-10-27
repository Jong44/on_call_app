import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:one_call_app/app/models/ResponModel.dart';

class MapsService {
  final googleKey = dotenv.env['GOOGLE_MAPS_API_KEY'];

  Future getCurrentLocation(LatLng position) async {
    final stringPosition = '${position.latitude}%2C${position.longitude}';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$stringPosition&key=$googleKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return {
        'status': 'success',
        'data': response.body,
      };
    } else {
      return {
        'status': 'error',
        'message': 'Failed to get current location',
        'data': url,
      };
    }
  }

  Future<ResponModel> getDirections(LatLng origin, LatLng destination) async {
    final stringOrigin = '${origin.latitude},${origin.longitude}';
    final stringDestination =
        '${destination.latitude},${destination.longitude}';
    final url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$stringOrigin&destination=$stringDestination&key=$googleKey';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final ressData = {
        'distance': data['routes'][0]['legs'][0]['distance']['text'],
        'duration': data['routes'][0]['legs'][0]['duration']['text'],
        'polyline': data['routes'][0]['overview_polyline']['points'],
      };
      return ResponModel(
        status: 'success',
        data: ressData,
        message: 'Success get directions',
      );
    } else {
      return ResponModel(
        status: 'error',
        message: 'Failed to get directions',
        data: url,
      );
    }
  }
}
