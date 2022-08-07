import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color? color;
  final Widget child;

  const MyCard({Key? key, this.color, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        color: color ?? Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: child);
  }
}
