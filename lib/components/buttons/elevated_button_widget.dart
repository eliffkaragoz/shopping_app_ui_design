import 'package:flutter/material.dart';

import '../text.dart';

class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      this.buttonColor,
      this.textColor,
      this.textSize,
      this.buttonHeight,
      this.buttonWeight,
      this.borderSideColor})
      : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Color? buttonColor;
  final Color? textColor;
  final double? textSize;
  final double? buttonHeight;
  final double? buttonWeight;
  final Color? borderSideColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderSideColor ?? Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          primary: buttonColor,
          fixedSize: Size(buttonWeight ?? 340, buttonHeight ?? 50)),
      child: MyText(
        text: text,
        fontSize: textSize ?? 16,
        color: textColor,
      ),
    );
  }
}
