// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:ui_design_2/view/home/model/product.dart';
import '../../components/card.dart';
import '../../components/text.dart';
import '../../extension/context_extension.dart';
import '../product_detail/product_detail_view.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  List productList = [
    Product(
        productName: "Jordon Zoom Seperate PD",
        price: "133",
        isFavorite: false,
        // ignore: prefer_const_constructors
        image: AssetImage("assets/1.jpg")),
    Product(
        productName: "Jordon Zoom ",
        price: "1200",
        isFavorite: false,
        // ignore: prefer_const_constructors
        image: AssetImage("assets/2.jpg")),
    // ignore: duplicate_ignore
    Product(
        productName: "Nike Air Zoom",
        price: "160",
        isFavorite: false,
        // ignore: prefer_const_constructors
        image: AssetImage("assets/4.jpg")),
    Product(
        productName: "Tonny Black Siyah Beyaz Unisex Sneaker ",
        price: "127",
        isFavorite: true,
        image: AssetImage("assets/5.jpg")),
    Product(
        productName: "Nike Air Zoom",
        price: "160",
        isFavorite: false,
        // ignore: prefer_const_constructors
        image: AssetImage("assets/4.jpg")),
    Product(
        productName: "Tonny Black Siyah Beyaz Unisex Sneaker ",
        price: "127",
        isFavorite: true,
        image: AssetImage("assets/5.jpg")),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.dynamicHeight(1),
        width: context.dynamicWidth(1),
        child: GridView.builder(
            primary: false,
            itemCount: productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                //  childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (ctx, index) {
              return _buildProductCard(productList[index]);
            }));
  }

  GestureDetector _buildProductCard(Product product) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => ProductDetailView(
                  image: product.image,
                  productName: product.productName,
                  price: product.price),
            ),
          );
        },
        child: MyCard(
            child: Padding(
          padding: context.paddingNormal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPriceInCard(product.price),
              Flexible(
                child: Image(image: product.image),
              ),
              Row(
                children: [
                  _buildProductNameText(product.productName),
                  _buildIsFavoriteIcon(product.isFavorite)
                ],
              )
            ],
          ),
        )));
  }

  SizedBox _buildProductNameText(String productName) {
    return SizedBox(
      height: context.dynamicHeight(0.04),
      width: context.dynamicWidth(0.2),
      child: MyText(
        text: productName,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _buildIsFavoriteIcon(bool isFavorite) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // ignore: avoid_print

          isFavorite == true ? isFavorite = false : isFavorite = true;
          print(isFavorite);
          // ignore: avoid_print
        });
      },
      child: IconButton(
          onPressed: () {
            setState(() {
              // ignore: avoid_print

              isFavorite == true ? isFavorite = false : isFavorite = true;
              // ignore: avoid_print
              print(isFavorite);
            });
          },
          icon: isFavorite == true
              ? Icon(Icons.favorite_border)
              : Icon(
                  Icons.favorite,
                  color: Colors.red,
                )),
    );
  }

  Align _buildPriceInCard(String price) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        padding: context.paddingAllLow,
        height: context.dynamicHeight(0.04),
        width: context.dynamicWidth(0.14),
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.all(Radius.circular(context.lowValue))),

        child: Center(
            child: MyText(
          // ignore: unnecessary_brace_in_string_interps
          text: "\$ ${price}",
          color: Colors.white,
          fontSize: 14,
        )),
      ),
    );
  }
}
