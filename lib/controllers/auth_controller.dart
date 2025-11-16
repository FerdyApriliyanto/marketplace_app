import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;

  final isLoggedIn = false.obs;

  void login() {
    if (email.value.text.trim().isEmpty || password.value.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Email dan password tidak boleh kosong",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    Get.offAllNamed('/home');
  }
}
