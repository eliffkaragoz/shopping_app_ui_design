import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(
      {Key? key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.color})
      : super(key: key);

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color, fontSize: fontSize ?? 20, fontWeight: fontWeight),
    );
  }
}
