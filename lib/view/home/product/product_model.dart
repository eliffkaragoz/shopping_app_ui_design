import 'package:flutter/material.dart';

class Product {
  final String productName;
  final String price;
  final bool isFavorite;
  final AssetImage image;

  Product(
      {required this.productName,
      required this.price,
      required this.isFavorite,
      required this.image});
}
