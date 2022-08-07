// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)),
        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          BoxShadow(blurRadius: 5, color: Colors.black12),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.crop_square_sharp),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
