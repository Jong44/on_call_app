import 'dart:async';

import 'package:get/get.dart';

class EmergencyDetailController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emergencyMap();
  }

  void emergencyMap() {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed('/emergency-map');
    });
  }
}
