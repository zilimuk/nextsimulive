import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String message,
    {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: BigText(text: title, color: Colors.grey),
    messageText: Text(
      message,
      style: const TextStyle(color: Color.fromARGB(255, 25, 25, 25)),
    ),
    colorText: Colors.black,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.white,
  );
}

// ignore: non_constant_identifier_names
BigText({required String text, required Color color}) {}
