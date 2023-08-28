import 'package:flutter/material.dart';
import 'package:magazine/utils/app_colors/app_color.dart';

class RegisterTextWidgets extends StatelessWidget {
  RegisterTextWidgets({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.color32,
          fontFamily: "SenRegular",
          fontSize: 18,
          fontWeight: FontWeight.w400),
    );
  }
}
