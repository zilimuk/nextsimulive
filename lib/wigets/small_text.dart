// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;
  SmallText({
    super.key,
    this.color = const Color(0x00292929),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: size,
          height: height),
    );
  }
}
