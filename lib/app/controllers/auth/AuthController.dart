import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_call_app/app/models/ResponModel.dart';
import 'package:one_call_app/app/services/AuthService.dart';
import 'package:one_call_app/app/widgets/dialogs/EmailVerificationDialog.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  var isLogin = true.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  void handleRegister() async {
    isLoading.value = true;

    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields');
      isLoading.value = false;
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Password does not match');
      isLoading.value = false;
      return;
    }
    Get.snackbar(
      'Loading',
      'Please wait',
      showProgressIndicator: true,
    );
    final ResponModel response = await AuthService().signUpWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );
    if (response.status == 'success') {
      final ResponModel ressVerif = await AuthService().emailVerification();
      if (ressVerif.status == 'success') {
        EmailVerificationDialog();
      } else {
        Get.snackbar(
          'Error',
          ressVerif.message,
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        response.message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    isLoading.value = false;
  }

  void handleLogin() async {
    isLoading.value = true;
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Isikan semua field',
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
      isLoading.value = false;
      return;
    }
    Get.snackbar(
      'Loading',
      'Please wait',
      showProgressIndicator: true,
    );
    final ResponModel response = await AuthService().signInWithEmailAndPassword(
      emailController.text,
      passwordController.text,
    );
    if (response.status == 'success') {
      Get.snackbar(
        'Success',
        "Login Berhasil",
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
      Get.toNamed('/');
    } else {
      Get.snackbar(
        'Error',
        response.message,
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
    emailController.clear();
    passwordController.clear();
    isLoading.value = false;
  }
}
