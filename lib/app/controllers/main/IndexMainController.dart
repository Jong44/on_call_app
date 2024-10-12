import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:one_call_app/app/services/MapsService.dart';
import 'package:one_call_app/app/views/main/menus/ContactPage.dart';
import 'package:one_call_app/app/views/main/menus/HomePage.dart';
import 'package:one_call_app/app/views/main/menus/InformationPage.dart';
import 'package:one_call_app/app/views/main/menus/ProfilePage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IndexMainController extends GetxController {
  late SharedPreferences prefs;
  LatLng currentPosition = const LatLng(0, 0);
  var address = ''.obs;
  var isPermissionGranted = false.obs;

  var currentIndex = 0.obs;
  Timer? timer;
  var isPress = false.obs;
  var isRiple = false.obs;

  List<Widget> pages = [
    const HomePage(),
    const ContactPage(),
    Container(),
    const InformationPage(),
    const ProfilePage(),
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentLocation();
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void startTimer() {
    timer = Timer(const Duration(seconds: 3), () {
      if (isPress.value) {
        longPress();
      }
    });
  }

  void stopTimer() {
    timer?.cancel();
  }

  void longPress() {
    Get.toNamed('/emergency-detail');
    isPress.value = false;
    timer?.cancel();
  }

  Future<void> getCurrentLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      isPermissionGranted.value = true;

      // Get current location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      currentPosition = LatLng(position.latitude, position.longitude);
      prefs.setDouble('latitude', position.latitude);
      prefs.setDouble('longitude', position.longitude);
      _getAddressFromLatLng(currentPosition);
    } else {
      isPermissionGranted.value = false;
    }
  }

  void _getAddressFromLatLng(LatLng position) async {
    final address =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    this.address.value = address.first.street.toString();
  }
}
