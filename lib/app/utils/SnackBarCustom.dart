import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarCustom {
  static void showSnackBarPengembangan(BuildContext context) {
    Get.snackbar(
      'Pengembangan',
      'Fitur ini masih dalam tahap pengembangan',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
