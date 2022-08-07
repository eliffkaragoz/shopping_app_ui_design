import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField(
      {Key? key,
      this.controller,
      this.cursorColor,
      this.hintText,
      this.onTap,
      this.textColor,
      this.hintTextColor,
      this.suffixIcon,
      this.suffixIconColor,
      this.textInputType,
      this.inputBorder,
      this.obscureText,
      this.fillColor,
      this.validators})
      : super(key: key);

  final TextEditingController? controller;
  final Color? cursorColor;
  final String? hintText;
  final VoidCallback? onTap;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintTextColor;
  final dynamic suffixIcon;
  final dynamic suffixIconColor;
  final TextInputType? textInputType;
  final dynamic inputBorder;
  final bool? obscureText;
  final String? Function(String?)? validators;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: controller,
      cursorColor: cursorColor,
      onTap: onTap,
      validator: validators,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor ?? const Color(0xFFECEFF1),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        suffixIcon: null == suffixIcon
            ? null
            : Icon(
                suffixIcon,
                color: suffixIconColor,
              ),
        hintText: hintText,
        hintStyle: TextStyle(color: hintTextColor),
      ),
    );
  }
}
