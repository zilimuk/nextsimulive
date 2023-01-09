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
      showCustomSnackBar("Enter password", title: "password");
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<AuthController>(builder: (
      authController,
    ) {
      return !authController.isLoading
          ? Scaffold(
              backgroundColor: Colors.white,
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
                            "Hello",
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Sign into your account",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[500],
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
                            child: TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                  hintText: "username",
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.deepOrangeAccent,
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
                                      borderRadius: BorderRadius.circular(15))),
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
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "password",
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.deepOrangeAccent,
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
                                      borderRadius: BorderRadius.circular(15))),
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
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      _login(authController);
                    },
                    child: Container(
                      width: screenHeight * 0.3,
                      height: screenHeight * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image:
                                AssetImage("assets/images/auth/loginbtn.png"),
                            fit: BoxFit.cover),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 18,
                        ),
                        children: const [
                          TextSpan(
                            text: " Create",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            // recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignupPage())
                          ),
                        ]),
                  )
                ]),
              ),
            )
          : const CustomLoader();
    });
  }
}
