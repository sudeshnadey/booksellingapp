
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ssgc/app/widgets/app_color.dart';

import '../../../widgets/text.dart';
import '../../search_screen/controllers/search_screen_controller.dart';
import '../controllers/change_password_controller.dart';

// ignore: must_be_immutable
class ChangePasswordView extends GetView<ChangePasswordController> {
  ChangePasswordController controller = Get.put(ChangePasswordController());
  SearchScreenController searchScreenController =
      Get.put(SearchScreenController());
  ChangePasswordView({Key? key}) : super(key: key);
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: BigText(text: "Change Password"),
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
            child: Column(
              children: [
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
                            controller: controller.oldPasswordController,
                            decoration: InputDecoration(
                                labelText: 'Old Password',
                                labelStyle: TextStyle(
                                    color: AppColor.black, fontSize: 13),
                                floatingLabelStyle:
                                    TextStyle(color: AppColor.mainColor),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: 'Search ',
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
                            controller: controller.newPasswordController,
                            decoration: InputDecoration(
                                labelText: 'New Password',
                                labelStyle: TextStyle(
                                    color: AppColor.black, fontSize: 13),
                                floatingLabelStyle:
                                    TextStyle(color: AppColor.mainColor),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: 'Search ',
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
                            controller: controller.confirmNewPasswordController,
                            decoration: InputDecoration(
                                labelText: 'Confirm New Password',
                                labelStyle: TextStyle(
                                    color: AppColor.black, fontSize: 13),
                                floatingLabelStyle:
                                    TextStyle(color: AppColor.mainColor),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: 'Search ',
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
                        // TextButton(
                        //   onPressed: () {
                        //     if (_formKey.currentState!.validate()) {
                        //       _formKey.currentState!.save();
                        //     }
                        //   },
                        //   child: const Text('Submit Button'),
                        // ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       TextFormField(
                //         controller: controller.oldPasswordController,
                //         decoration: const InputDecoration(
                //           labelText: 'Old Password',
                //           enabledBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 2, color: Color(0xFF00C9A7)),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 3, color: Color(0xFF00C9A7)),
                //           ),
                //           errorBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                //           ),
                //           isDense: true,
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 20,
                //       ),
                //       TextFormField(
                //         controller: controller.newPasswordController,
                //         decoration: const InputDecoration(
                //           labelText: 'New Password',
                //           enabledBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 2, color: Color(0xFF00C9A7)),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 3, color: Color(0xFF00C9A7)),
                //           ),
                //           errorBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                //           ),
                //           isDense: true,
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 20,
                //       ),
                //       TextFormField(
                //         controller: controller.confirmNewPasswordController,
                //         decoration: const InputDecoration(
                //           labelText: 'Confirm New Password',
                //           enabledBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 2, color: Color(0xFF00C9A7)),
                //           ),
                //           focusedBorder: OutlineInputBorder(
                //             borderSide:
                //                 BorderSide(width: 3, color: Color(0xFF00C9A7)),
                //           ),
                //           errorBorder: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 width: 3, color: Color.fromARGB(255, 66, 125, 145)),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
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
