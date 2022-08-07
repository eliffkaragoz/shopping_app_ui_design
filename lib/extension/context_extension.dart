import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  ThemeData get theme => Theme.of(this);
}

extension NumberExtension on BuildContext {
  double get lowValue => dynamicHeight(0.01);
  double get normalValue => dynamicHeight(0.02);
  double get mediumValue => dynamicHeight(0.03);
}

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingAllLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
}

extension BorderExtension on BuildContext {
  BorderRadiusGeometry get borderValue =>
      const BorderRadius.all(Radius.circular(16.0));
}

extension EmptyWidget on BuildContext {
  Widget get emptyWidgetHeight => SizedBox(
        height: lowValue,
      );
}
