import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../data/app_image.dart';
import '../../../widgets/text.dart';
import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: BigText(text: "Current Details"),
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            icon: const Icon(Icons.bookmark_border_outlined),
            color: Colors.black,
            onPressed: () {
              print("BookMarked!!");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              // padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),

              // background image
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 250.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(AppImage.demo),
                      ),
                    ),
                  ),
                  // introduction content
                  Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SmallText(
                              text: "Posted At: ",
                              color: Colors.red,
                              size: 13,
                            ),
                            SmallText(
                              text: " 01 Sep 2023",
                              color: Colors.grey,
                              size: 13,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: Get.width / 1.2,
                                child: BigText(
                                    text: "World Investment Report, 2023")),
                            const Icon(
                              Icons.share_rounded,
                              size: 25,
                              color: Colors.black54,
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 70,
                          child: Divider(
                            thickness: 3.5,
                            color: Colors.black12,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SmallText(
                            text:
                                "With the Prime Minister as the Chairperson, presently NITI Aayog consists of: Vice Chairperson: Suman Bery. Ex-Officio Members: Amit Shah, Rajnath Singh, Nirmala Sitaraman and Narendra Singh Tomar.",
                            color: Colors.grey.shade800),
                        SizedBox(
                          height: 10.h,
                        ),
                        BigText(
                          text: "About Niti Aayog",
                          size: 14,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        AboutText(
                          title: "\u2022 Released On - ",
                          description: "July 17, 2023",
                        ),
                        AboutText(
                          title: "\u2022 Published By - ",
                          description: "Niti Aayog",
                        ),
                        AboutText(
                          title: "\u2022 Based On - ",
                          description:
                              "National Institution for Transforming India",
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // tabs section
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}

class AboutText extends StatelessWidget {
  final String title;
  final String description;
  const AboutText({super.key, this.title = "", this.description = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: Get.width / 1.1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
            text: title,
            color: Colors.black,
            size: 14,
          ),
          Container(
            // color: Colors.amber,
            width: Get.width / 1.6,
            child: SmallText(
              overflow: TextOverflow.ellipsis,
              text: description,
              color: Colors.grey.shade800,
              size: 14,
            ),
          ),
        ],
      ),
    );
  }
}
