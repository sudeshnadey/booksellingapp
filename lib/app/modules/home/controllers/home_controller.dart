import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssgc/app/data/api_exception_handler/dio_expeption.dart';
import 'package:ssgc/app/data/models/banner/banner.dart';
import 'package:ssgc/app/data/urls.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  var controller = PageController();
  var isLoading = false;
  List<Banners> banners = [];
  static const int timeOutDuration = 100;

  getProducts() async {
    isLoading = true;
    try {
      final Dio dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: timeOutDuration * 1000),
          receiveTimeout: const Duration(seconds: timeOutDuration * 1000),
          sendTimeout: const Duration(seconds: timeOutDuration * 1000),
        ),
      );
      dynamic response = await dio.get(
        Urls.bannerUrl,
      );
      List<Banners> tempBanners =
          (response.data as List).map((x) => Banners.fromJson(x)).toList();
      banners.addAll(tempBanners);
      update();
      isLoading = false;
      return tempBanners;
    } on DioException catch (ex) {
      isLoading = false;
      final errorMessage = DioExceptions.fromDioError(ex);
      return Get.snackbar(
        'Error',
        errorMessage.message,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
