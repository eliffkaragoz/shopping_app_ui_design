import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: context.dynamicHeight(1),
        width: context.dynamicWidth(1),
        child: GridView.count(
          primary: false,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            _buildProductCard(
              // ignore: prefer_const_constructors
              image: AssetImage("assets/1.jpg"),
              productName: "Jordon Zoom Seperate PF",
              price: "133",
              isFavorite: true,
            ),
            _buildProductCard(
              // ignore: prefer_const_constructors
              image: AssetImage("assets/1.jpg"),
              productName: "Jordon Zoom Seperate PF",
              price: "133",
              isFavorite: true,
            ),
            _buildProductCard(
              // ignore: prefer_const_constructors
              image: AssetImage("assets/1.jpg"),
              productName: "Jordon Zoom Seperate PF",
              price: "133",
              isFavorite: true,
            ),
            _buildProductCard(
              // ignore: prefer_const_constructors
              image: AssetImage("assets/1.jpg"),
              productName: "Jordon Zoom Seperate PF",
              price: "133",
              isFavorite: true,
            ),
            _buildProductCard(
              // ignore: prefer_const_constructors
              image: AssetImage("assets/1.jpg"),
              productName: "Jordon Zoom Seperate PF",
              price: "133",
              isFavorite: true,
            ),
            _buildProductCard(
              // ignore: prefer_const_constructors
              image: AssetImage("assets/1.jpg"),
              productName: "Jordon Zoom Seperate PF",
              price: "133",
              isFavorite: true,
            ),
          ],
        )
        // CustomScrollView(
        //   primary: false,
        //   slivers: <Widget>[
        //     SliverPadding(
        //       padding: const EdgeInsets.all(0.1),
        //       sliver: SliverGrid.count(
        //         crossAxisSpacing: 10,
        //         mainAxisSpacing: 10,
        //         crossAxisCount: 2,
        //         //Burada ListView.builder içerisinde yapmaya çalıştım ama çok hata aldım
        //         children: <Widget>[
        //           _buildProductCard(
        //             // ignore: prefer_const_constructors
        //             image: AssetImage("assets/1.jpg"),
        //             productName: "Jordon Zoom Seperate PF",
        //             price: "133",
        //             isFavorite: true,
        //           ),
        //           _buildProductCard(
        //             // ignore: prefer_const_constructors
        //             image: AssetImage("assets/2.jpg"),
        //             productName: "Jordon Zoom Seperate PF",
        //             price: "1500",

        //             isFavorite: false,
        //           ),
        // _buildProductCard(
        //   // ignore: prefer_const_constructors
        //   image: AssetImage("assets/1.jpg"),
        //   productName: "Jordon Zoom Seperate PF",
        //   price: "133",
        //   isFavorite: true,
        // ),
        //           _buildProductCard(
        //             // ignore: prefer_const_constructors
        //             image: AssetImage("assets/2.jpg"),
        //             productName: "Jordon Zoom Seperate PF",
        //             price: "1500", isFavorite: false,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ],
        // ));
        );
  }

  GestureDetector _buildProductCard(
      {required AssetImage image,
      required String productName,
      required String price,
      required bool isFavorite}) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => ProductDetailView(
                  image: image, productName: productName, price: price),
            ),
          );
        },
        child: MyCard(
            child: Padding(
          padding: context.paddingNormal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPriceInCard(price),
              Flexible(
                child: Image(image: image),
              ),
              Row(
                children: [
                  _buildProductNameText(productName),
                  _buildIsFavoriteIcon(isFavorite)
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

  IconButton _buildIsFavoriteIcon(bool isFavorite) {
    return IconButton(
        onPressed: () {
          setState(() {
            isFavorite == true ? isFavorite = false : isFavorite = true;
          });
        },
        icon: isFavorite == true
            // ignore: prefer_const_constructors
            ? Icon(Icons.favorite_border)
            // ignore: prefer_const_constructors
            : Icon(
                Icons.favorite,
                color: Colors.red,
              ));
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
