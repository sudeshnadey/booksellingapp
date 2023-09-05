import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ssgc/app/widgets/app_color.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.mainColor,
        onPressed: () {},
        child: Icon(
          Icons.question_answer_rounded,
          color: AppColor.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
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
                          child:
                              BigText(text: "World Investment Report, 2023")),
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
                  const AboutText(
                    title: "Released On - ",
                    description: "July 17, 2023",
                  ),
                  const AboutText(
                    title: "Published By - ",
                    description: "Niti Aayog",
                  ),
                  const AboutText(
                    title: "Based On - ",
                    description: "National Institution for Transforming India",
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  BigText(
                    text: "Comments",
                    size: 16.5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SmallText(
              text: "No Comment Found",
              size: 13,
            ),
            // tabs section
            const SizedBox(
              height: 50,
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
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: '\u2022 ${title}',
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.black,
          )),
      TextSpan(
          text: description,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 14,
          )),
    ]));
  }
}
