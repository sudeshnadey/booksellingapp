import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssgc/app/modules/catalog_product/views/catalog_product_view.dart';
import 'package:ssgc/app/widgets/app_color.dart';
import 'package:ssgc/app/widgets/text.dart';

import '../controllers/detail_page_controller.dart';

class DetailPageView extends GetView<DetailPageController> {
  const DetailPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: BigText(text: "SHOP OUR BOOKS"),
          centerTitle: true,
          leading: IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: AppColor.mainColor,
            isScrollable: true,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            labelColor: Colors.black,

            // indicator: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10), // Creates border
            //     color: AppColor.mainColor),
            tabs: const [
              Tab(
                text: "New release",
              ),
              Tab(
                text: "New",
              ),
              Tab(
                text: "National",
              ),
              Tab(
                text: "International",
              ),
              Tab(
                text: "Science",
              ),
              Tab(
                text: "Economics",
              ),
            ],
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    CatalogProductView(text: "New Release"),
                    CatalogProductView(text: "National"),
                    CatalogProductView(text: "International"),
                    CatalogProductView(text: "Science"),
                    CatalogProductView(text: "Economics"),
                  ],
                ),
              ),
              CatalogProductView(text: "New Release"),
              CatalogProductView(text: "National"),
              CatalogProductView(text: "International"),
              CatalogProductView(text: "Science"),
              CatalogProductView(text: "Economics"),
            ],
          ),
        ),
      ),
    );
  }
}
