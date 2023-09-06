import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerSupportController extends GetxController {
  //TODO: Implement CustomerSupportController

  final count = 0.obs;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
