import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ssgc/app/data/app_image.dart';
import 'package:ssgc/app/modules/detail_page/views/detail_page_view.dart';
import 'package:ssgc/app/modules/notification/views/notification_view.dart';
import 'package:ssgc/app/modules/search_screen/views/search_screen_view.dart';
import 'package:ssgc/app/utils/categories.dart';
import 'package:ssgc/app/widgets/app_color.dart';

import '../../../widgets/text.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeController homeController = Get.put(HomeController());
  final PageController _pageController = PageController();
  HomeView({Key? key}) : super(key: key);
  List<String> yourImageList = [
    'assets/images/banner.png',
    'assets/images/bannerimage.png',
    'assets/images/book1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        appBar: AppBar(
          toolbarHeight: 55,
          elevation: 2,
          backgroundColor: AppColor.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: BigText(
              text: "Baudhik Prakashan Pariksha Vani",
              size: 15,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(() => SearchScreenView());
              },
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 3,
                            offset: Offset(1, 1)),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const NotificationView());
              },
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            spreadRadius: 3,
                            offset: Offset(1, 1)),
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(
                    //     left: 10,
                    //     right: 10,
                    //   ),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       BigText(text: "Ghatana Chakra"),
                    //       // const SizedBox(
                    //       //   width: 70,
                    //       // ),
                    //       Row(
                    //         children: [
                    //           Container(
                    //               padding: const EdgeInsets.all(8),
                    //               decoration: BoxDecoration(
                    //                   color: AppColor.mainColor,
                    //                   boxShadow: const [
                    //                     BoxShadow(
                    //                         color: Colors.black12,
                    //                         blurRadius: 5,
                    //                         spreadRadius: 3,
                    //                         offset: Offset(1, 1)),
                    //                   ],
                    //                   borderRadius: BorderRadius.circular(10)),
                    //               child: const Icon(
                    //                 Icons.search_outlined,
                    //                 color: Colors.white,
                    //               )),
                    //           const SizedBox(
                    //             width: 15,
                    //           ),
                    //           Container(
                    //               padding: const EdgeInsets.all(8),
                    //               decoration: BoxDecoration(
                    //                   color: AppColor.mainColor,
                    //                   boxShadow: const [
                    //                     BoxShadow(
                    //                         color: Colors.black12,
                    //                         blurRadius: 5,
                    //                         spreadRadius: 3,
                    //                         offset: Offset(1, 1)),
                    //                   ],
                    //                   borderRadius: BorderRadius.circular(10)),
                    //               child: const Icon(
                    //                 Icons.notifications_active_outlined,
                    //                 color: Colors.white,
                    //               )),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    GetBuilder<HomeController>(
                      builder: (controller) {
                        return controller.isLoading == false
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 900.w,
                                    child: CarouselSlider(
                                      items:
                                          controller.banners.map((imagePath) {
                                        return GestureDetector(
                                          onTap: () {
                                            // Handle tap on the image if needed
                                          },
                                          child: Card(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                imagePath.image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      options: CarouselOptions(
                                        autoPlay: true,
                                        enlargeCenterPage: true,
                                        aspectRatio: 2.0,
                                        viewportFraction: 1.75,
                                        enableInfiniteScroll: true,
                                        autoPlayInterval:
                                            const Duration(seconds: 3),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SmoothPageIndicator(
                                    controller: homeController.controller,
                                    count: yourImageList.length,
                                    effect: ExpandingDotsEffect(
                                        activeDotColor: AppColor.mainColor,
                                        dotColor: Colors.grey,
                                        dotHeight: 8,
                                        dotWidth: 8),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              )
                            : Shimmer.fromColors(
                                baseColor: Color.fromARGB(255, 1, 143, 127),
                                highlightColor:
                                    Color.fromARGB(255, 68, 164, 172),
                                enabled: true,
                                child: SizedBox(
                                  height: 200,
                                  width: 900.w,
                                ),
                              );
                      },
                    )
                  ],
                ),
              ),
              // here fetch data from api
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // mainAxisSpacing: 5,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.75,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    childCount: Categories.categories.length,
                    (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const DetailPageView());
                        },
                        child: Container(
                            decoration: const BoxDecoration(
                                // color: AppColor.backgroundColor,
                                // // border: Border.all(color: Colors.grey),
                                // borderRadius: BorderRadius.circular(10),
                                // boxShadow: const [
                                //   BoxShadow(
                                //       color: Colors.black12,
                                //       blurRadius: 5,
                                //       spreadRadius: 3,
                                //       offset: Offset(1, 1)),
                                // ],
                                ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 10, bottom: 10),
                                  child: Column(
                                    children: [
                                      BigText(
                                        text:
                                            Categories.categories[index].title,
                                        size: 15,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 160,
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 5,
                                            spreadRadius: 3,
                                            offset: Offset(1, 1)),
                                      ],
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(Categories
                                              .categories[index].imageUrl),
                                          fit: BoxFit.fitHeight)),
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ),
            ]),
          ),
        ));
  }

  Widget _buildListItem(BuildContext context, int index) {
    return SizedBox(
      child: Card(
        // elevation: 12,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Image.asset(
            AppImage.banner,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
