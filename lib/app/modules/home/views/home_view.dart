import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:ssgc/app/data/app_image.dart';
import 'package:ssgc/app/modules/detail_page/views/detail_page_view.dart';
import 'package:ssgc/app/modules/e_book_details/views/e_book_details_view.dart';
import 'package:ssgc/app/modules/notification/views/notification_view.dart';
import 'package:ssgc/app/modules/search_screen/views/search_screen_view.dart';
import 'package:ssgc/app/utils/categories.dart';
import 'package:ssgc/app/widgets/app_color.dart';

import '../../../widgets/text.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeController homeController = Get.put(HomeController());
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        appBar: AppBar(
          toolbarHeight: 55,
          elevation: 2,
          backgroundColor: AppColor.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: BigText(text: "Book's "),
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
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => NotificationView());
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
            SizedBox(
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

                    Column(
                      children: [
                        SizedBox(
                          height: 200,
                          child: PageView.builder(
                              controller: homeController.controller,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(() => const EBookDetailsView());
                                  },
                                  child: SizedBox(
                                    child: Card(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          AppImage.banner,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SmoothPageIndicator(
                          controller: homeController.controller,
                          count: 10,
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
                  ],
                ),
              ),
              // here fetch data from api 
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
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
                                          image: AssetImage(AppImage.demo),
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
