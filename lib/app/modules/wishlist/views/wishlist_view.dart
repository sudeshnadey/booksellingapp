import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/app_image.dart';
import '../../../widgets/app_color.dart';
import '../../../widgets/empty_widget.dart';
import '../../../widgets/text.dart';
import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: BigText(text: "Wishlist"),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
            onPressed: () {
              Get.back();
            },
          ),
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 30),
            indicatorColor: AppColor.mainColor,
            isScrollable: true,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            labelColor: AppColor.mainColor,
            unselectedLabelColor: Colors.black54,
            tabs: const [
              Tab(
                text: "All",
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
          child: TabBarView(
            children: [
              EmptyView(
                  image: AssetImage(AppImage.wishlist),
                  mainText: " Your Wishlist is Empty",
                  subText: "Explore More And Shortlist Some Items"),
              EmptyView(
                  image: AssetImage(AppImage.wishlist),
                  mainText: " Your Wishlist is Empty",
                  subText: "Explore More And Shortlist Some Items"),
              EmptyView(
                  image: AssetImage(AppImage.wishlist),
                  mainText: " Your Wishlist is Empty",
                  subText: "Explore More And Shortlist Some Items"),
              EmptyView(
                  image: AssetImage(AppImage.wishlist),
                  mainText: " Your Wishlist is Empty",
                  subText: "Explore More And Shortlist Some Items"),
              EmptyView(
                  image: AssetImage(AppImage.wishlist),
                  mainText: " Your Wishlist is Empty",
                  subText: "Explore More And Shortlist Some Items"),
              EmptyView(
                  image: AssetImage(AppImage.wishlist),
                  mainText: " Your Wishlist is Empty",
                  subText: "Explore More And Shortlist Some Items"),
            ],
          ),
        ),
      ),
    );
  }
}
