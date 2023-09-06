import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ssgc/app/modules/all_products/views/all_products_view.dart';
import 'package:ssgc/app/modules/product_detail/views/product_detail_view.dart';

import '../../../data/app_image.dart';
import '../../../utils/categories.dart';
import '../../../widgets/text.dart';
import '../controllers/catalog_product_controller.dart';

class CatalogProductView extends GetView<CatalogProductController> {
  final String text;
  const CatalogProductView({
    Key? key,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: text,
                    size: 15,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const AllProductsView());
                      },
                      child: SmallText(
                        text: "View all",
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
            // here fetch data from api
            Container(
              height: 210,
              child: ListView.builder(
                  itemCount: Categories.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Get.to(() => const ProductDetailView());
                      },
                      child: CatalogProductCard(index: index))),
            )
          ],
        ),
      ),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  final int index;

  const CatalogProductCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            // color: Colors.white,
            // borderRadius: BorderRadius.circular(10),
            // boxShadow: const [
            //   BoxShadow(
            //       color: Colors.black26,
            //       blurRadius: 5,
            //       spreadRadius: 3,
            //       offset: Offset(1, 1)),
            // ],
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Column(
                children: [
                  BigText(
                    text: Categories.categories[index].title,
                    size: 15,
                  )
                ],
              ),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 3,
                        spreadRadius: 2,
                        offset: Offset(1, 1)),
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(AppImage.demo), fit: BoxFit.fitHeight)),
            ),
          ],
        ));
  }
}
