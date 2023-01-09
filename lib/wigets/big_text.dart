// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  TextOverflow overflow;
  double size;
  BigText({
    super.key,
    this.color = const Color(0xFF332D2B),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style:
          TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: size),
    );
  }
}
