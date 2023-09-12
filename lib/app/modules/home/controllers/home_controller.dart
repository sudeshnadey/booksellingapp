import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  void increment() => count.value++;

  var controller = PageController();

  // List<String> yourImageList = [
  //   'assets/image1.jpg',
  //   'assets/image2.jpg',
  //   'assets/image3.jpg',
  // ];
}
