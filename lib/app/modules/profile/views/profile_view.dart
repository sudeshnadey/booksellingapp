import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ssgc/app/data/app_image.dart';

import '../../../widgets/app_color.dart';
import '../../../widgets/text.dart';
import '../../search_screen/controllers/search_screen_controller.dart';
import '../controllers/profile_controller.dart';

// ignore: must_be_immutable
class ProfileView extends GetView<ProfileController> {
  ProfileController profileController = Get.put(ProfileController());
  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());
  ProfileView({Key? key}) : super(key: key);
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: BigText(text: "Profile"),
        centerTitle: true,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: AppColor.textColor.withOpacity(0.3),
                    child: CircleAvatar(
                      radius: 62.r,
                      backgroundColor: AppColor.white,
                      backgroundImage: AssetImage(AppImage.person),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: Get.width / 1.1,
                            child: TextFormField(
                              controller: profileController.nameController,
                              decoration: InputDecoration(
                                  labelText: 'Full Name',
                                  labelStyle: TextStyle(
                                      color: AppColor.black, fontSize: 13),
                                  floatingLabelStyle:
                                      TextStyle(color: AppColor.mainColor),
                                  contentPadding: const EdgeInsets.all(16),
                                  hintStyle: const TextStyle(fontSize: 13),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00C9A7))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00C9A7)))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: Get.width / 1.1,
                            child: TextFormField(
                              controller: profileController.emailController,
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(
                                      color: AppColor.black, fontSize: 13),
                                  floatingLabelStyle:
                                      TextStyle(color: AppColor.mainColor),
                                  contentPadding: const EdgeInsets.all(16),
                                  hintStyle: const TextStyle(fontSize: 13),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00C9A7))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00C9A7)))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: Get.width / 1.1,
                            child: TextFormField(
                              controller: profileController.phoneController,
                              decoration: InputDecoration(
                                  labelText: 'Phone',
                                  labelStyle: TextStyle(
                                      color: AppColor.black, fontSize: 13),
                                  floatingLabelStyle:
                                      TextStyle(color: AppColor.mainColor),
                                  contentPadding: const EdgeInsets.all(16),
                                  hintStyle: const TextStyle(fontSize: 13),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00C9A7))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00C9A7)))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: Get.width / 1.1,
                            child: TextFormField(
                              controller: profileController.studyTimeController,
                              decoration: InputDecoration(
                                  labelText: 'Set Study Time',
                                  labelStyle: TextStyle(
                                      color: AppColor.black, fontSize: 13),
                                  floatingLabelStyle:
                                      TextStyle(color: AppColor.mainColor),
                                  contentPadding: const EdgeInsets.all(16),
                                  hintStyle: const TextStyle(fontSize: 13),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00C9A7))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00C9A7)))),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: Get.width / 1.1,
                            child: TextFormField(
                              controller:
                                  profileController.referralCodeController,
                              decoration: InputDecoration(
                                  labelText: 'Referral Code',
                                  labelStyle: TextStyle(
                                      color: AppColor.black, fontSize: 13),
                                  floatingLabelStyle:
                                      TextStyle(color: AppColor.mainColor),
                                  contentPadding: const EdgeInsets.all(16),
                                  hintStyle: const TextStyle(fontSize: 13),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00C9A7))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Color(0xFF00C9A7)))),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SmallText(
                            text: "Add New Address",
                            color: AppColor.mainColor,
                          ),
                          const SizedBox(
                            height: 120,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            right: 10,
            left: 10,
            child: GestureDetector(
              onTap: () {
                print("TAPPED!");
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                }
                ;
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: 55,
                  decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: BigText(
                      text: "SUBMIT",
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
