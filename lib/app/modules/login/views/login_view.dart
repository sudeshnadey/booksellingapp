import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssgc/app/widgets/text.dart';

import '../../../data/app_image.dart';
import '../../../widgets/app_color.dart';
import '../../bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import '../controllers/login_controller.dart';

// ignore: must_be_immutable
class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 55,
          elevation: 2,
          backgroundColor: AppColor.white,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(child: BigText(text: "Ojhavani Publications")),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      BigText(
                        text: "Log In",
                        size: 25,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width / 1.1,
                          child: TextFormField(
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                hintText: 'Phone ',
                                hintStyle: const TextStyle(fontSize: 13),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF00C9A7)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      SmallText(
                        text: "Login With Password",
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: BigText(
                          text: "LOG IN",
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                SmallText(
                  text: "Or Log In Using Social Media",
                  color: Colors.grey,
                  size: 14,
                ),
                const SizedBox(
                  height: 25,
                ),
                SignOptions(
                  icon: Icons.phone_android,
                  text: "Sign in with Google",
                  image: AssetImage(AppImage.google),
                ),
                SignOptions(
                  icon: Icons.phone_android,
                  text: "Sign in with Facebook",
                  backgroundColor: Colors.blue,
                  image: AssetImage(AppImage.facebook),
                ),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => BottomNavigationBarView());
                  },
                  child: SmallText(
                    text: "Guest User",
                    color: AppColor.mainColor,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class SignOptions extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color backgroundColor;
  final Color color;
  final AssetImage image;
  const SignOptions(
      {super.key,
      required this.icon,
      required this.text,
      this.backgroundColor = Colors.white,
      this.color = Colors.black,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 14,
            backgroundImage: image,
          ),
          BigText(
            text: text,
            color: color,
            size: 15,
          ),
          Icon(
            Icons.abc,
            color: backgroundColor,
          )
        ],
      ),
    );
  }
}
