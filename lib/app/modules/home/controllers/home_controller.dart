import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssgc/app/data/models/banner/banner.dart';

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
  String url =
      "https://api.bhattacharjeesolution.in/book/api/user-show-banner.php";

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
      // dio.options.headers['token'] =
      //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoidXNlciIsInBob25lIjoiMTIzNDQzNDM0In0.YTWuqWB4mZT8mTlheoPj4YgHLXJwbPcr1f5jq1Em_VI';
      dynamic response = await dio.get(
        url,
      );

      List<Banners> tempBanners =
          (response.data as List).map((x) => Banners.fromJson(x)).toList();
      banners.addAll(tempBanners);
      update();
      isLoading = false;
      return tempBanners;
    } on DioException catch (ex) {
      isLoading = false;
      return Get.snackbar(
        'Error',
        ex.message ?? "",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
