// Getx Dialog for email verification

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/config/ColorConfig.dart';

void EmailVerificationDialog() {
  Get.defaultDialog(
    buttonColor: ColorConfig.primaryColor,
    confirmTextColor: Colors.white,
    title: 'Verifikasi Email',
    content: const Column(
      children: [
        Text(
          'Silahkan cek email Anda untuk verifikasi akun.',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
      ],
    ),
    onConfirm: () {
      Get.back();
    },
  );
}
