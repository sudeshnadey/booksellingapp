import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ssgc/app/modules/change_password/views/change_password_view.dart';
import 'package:ssgc/app/modules/membership/views/membership_view.dart';
import 'package:ssgc/app/modules/my_orders/views/my_orders_view.dart';
import 'package:ssgc/app/modules/profile/views/profile_view.dart';
import 'package:ssgc/app/modules/refer_and_earn/views/refer_and_earn_view.dart';
import 'package:ssgc/app/modules/wishlist/views/wishlist_view.dart';

import '../../../data/app_image.dart';
import '../../../widgets/account_items.dart';
import '../../../widgets/app_color.dart';
import '../../../widgets/text.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: BigText(
                            text: "Hi, Guest",
                            size: 17,
                          )),
                          const SizedBox(
                            height: 10,
                          ),
                          SmallText(
                            text: "please login ro enjoy your shopping",
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40,
                        backgroundImage: AssetImage(AppImage.person),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ProfileView());
                  },
                  child: const AccountItems(
                    icon: Icons.person_2_outlined,
                    title: "Profile",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => MembershipView());
                  },
                  child: const AccountItems(
                    icon: Icons.card_membership,
                    title: "Membership",
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => MyOrdersView());
                  },
                  child: const AccountItems(
                      icon: Icons.local_mall_outlined, title: "My Orders"),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => WishlistView());
                  },
                  child: const AccountItems(
                      icon: Icons.favorite_border_outlined,
                      title: "Wishlist/Save for later"),
                ),
                const AccountItems(
                    icon: Icons.support_agent_outlined,
                    title: "Customer Support"),
                const AccountItems(
                    icon: Icons.badge_outlined, title: "Earn Accounts"),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ReferAndEarnView());
                  },
                  child: const AccountItems(
                      icon: Icons.military_tech_outlined,
                      title: "Refer & Get Points"),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ChangePasswordView());
                  },
                  child: const AccountItems(
                    icon: Icons.lock_reset_outlined,
                    title: "Change Password",
                  ),
                ),
                const AccountItems(
                  icon: Icons.info_outline,
                  title: "About Us",
                ),
                const AccountItems(
                  icon: Icons.help_outline,
                  title: "Terms & Conditions",
                ),
                GestureDetector(
                  onTap: () => showExitPopup(context),
                  child: const AccountItems(
                    icon: Icons.logout_outlined,
                    title: "Logout",
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

showExitPopup(context) async {
  return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Do you want to exit?"),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.mainColor),
                        child: const Text("Yes"),
                      ),
                    ),
                    const SizedBox(width: 25),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.buttoncolor,
                      ),
                      child: const Text("No",
                          style: TextStyle(color: Colors.white)),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}
