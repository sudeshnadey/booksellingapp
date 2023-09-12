import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ssgc/app/data/app_image.dart';
import 'package:ssgc/app/widgets/empty_widget.dart';
import '../../../widgets/text.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: BigText(text: "My Cart"),
          centerTitle: true,
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmptyView(
                  image: AssetImage(AppImage.empty_cart),
                  mainText: "Ohh... Your Cart is Empty",
                  subText: "Add Something To Make Me Happy  : )",
                )
              ],
            )),
      ),
    );
  }
}
