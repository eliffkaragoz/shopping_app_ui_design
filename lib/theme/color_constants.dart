import 'package:flutter/material.dart';

class CustomColorScheme {
  static CustomColorScheme? _instance;
  static CustomColorScheme get instance =>
      _instance ??= CustomColorScheme._init();
  CustomColorScheme._init();

  final Color appBlack = const Color(0xFF12090b);

  final Color grayText = const Color(0xFFBDBDBD);
  final Color grayButton = const Color(0xFF424242);
  final Color inactiveButtonColor = const Color(0xFFC5CAE9);
  final Color appWhite = const Color(0xFFFFFFFF);
}
