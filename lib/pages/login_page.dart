import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simulive/Auth/auth_controller.dart';
import 'package:simulive/base/custom_loader.dart';
import 'package:simulive/base/show_custom_snack_bar.dart';
import 'package:simulive/helper/route_helper.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  var usernameController = TextEditingController();

  var passwordController = TextEditingController();

  void _login(AuthController authController) {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if (username.isEmpty) {
      showCustomSnackBar("Enter username", title: "Username");
    } else if (password.isEmpty) {
      showCustomSnackBar("Enter password", title: "Password");
    } else if (password.length < 6) {
      showCustomSnackBar("Password must not be less than six charachers",
          title: "Password");
      // Get.toNamed(RouteHelper.homePage);
    } else {
      authController.login(username, password).then((status) {
        if (status.isSuccess) {
          Get.toNamed(RouteHelper.homePage);
        } else {
          showCustomSnackBar(status.message);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _obsecureText = true;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<AuthController>(builder: (
      authController,
    ) {
      return !authController.isLoading
          ? Scaffold(
              backgroundColor: Colors.black,
              body: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    width: screenWidth,
                    height: screenHeight * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/auth/loginimg.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width: screenWidth,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome",
                            style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const Text(
                            "Back !",
                            style: TextStyle(
                              fontSize: 48,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.08,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 7,
                                      offset: const Offset(1, 1),
                                      color: Colors.grey.withOpacity(0.2)),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                    hintText: "username",
                                    suffixIcon: const Icon(
                                      Icons.email,
                                      color: Color.fromARGB(246, 250, 17, 17),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 7,
                                      offset: const Offset(1, 1),
                                      color: Colors.grey.withOpacity(0.2)),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextField(
                                controller: passwordController,
                                obscureText: _obsecureText,
                                decoration: InputDecoration(
                                    hintText: "password",
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        _obsecureText = !_obsecureText;
                                      },
                                      child: Icon(
                                          _obsecureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: const Color.fromARGB(
                                              246, 250, 17, 17)),

                                      // Icons.remove_red_eye_outlined,
                                      // color: Color.fromARGB(246, 250, 17, 17),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(),
                              ),
                              Text(
                                "Forgot password",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              margin:
                                  const EdgeInsets.only(left: 30, right: 20),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ))),
                      GestureDetector(
                        onTap: () {
                          _login(authController);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          width: screenHeight * 0.15,
                          height: screenHeight * 0.07,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/auth/loginbtn.png"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   height: screenHeight * 0.03,
                  // ),
                  // RichText(
                  //   text: TextSpan(
                  //       text: "Don't have an account?",
                  //       style: TextStyle(
                  //         color: Colors.grey[500],
                  //         fontSize: 18,
                  //       ),
                  //       children: const [
                  //         TextSpan(
                  //           text: " Create",
                  //           style: TextStyle(
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 18,
                  //           ),
                  //           // recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignupPage())
                  //         ),
                  //       ]),
                  // )
                ]),
              ),
            )
          : const CustomLoader();
    });
  }
}
