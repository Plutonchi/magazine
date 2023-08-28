import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? hintText;
  RegisterWidget(
      {super.key,
      required this.controller,
      this.suffixIcon,
      this.obscureText = false,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontFamily: "SenRegular",
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          fontFamily: "SenRegular",
          fontWeight: FontWeight.w400,
          color: Color(0xFFA0A5BA),
        ),
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffF0F5FA)),
            borderRadius: BorderRadius.circular(19)),
        fillColor: Color(0xffF0F5FA),
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffF0F5FA),
            ),
            borderRadius: BorderRadius.circular(19)),
      ),
    );
  }
}
