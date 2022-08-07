// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:ui_design_2/components/buttons/elevated_button_widget.dart';
import 'package:ui_design_2/components/card.dart';
import 'package:ui_design_2/components/text.dart';
import 'package:ui_design_2/theme/color_constants.dart';
import 'package:ui_design_2/extension/context_extension.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({
    Key? key,
    required this.image,
    required this.price,
    required this.productName,
  }) : super(key: key);

  final AssetImage image;
  final String price;
  final String productName;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f3f3),
      appBar: _buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
              child: Image(
            image: widget.image,
          )),
          _buildProductInformation(),
        ],
      ),
      bottomNavigationBar: _buildNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
      ],
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: CustomColorScheme.instance.appWhite,
      centerTitle: true,
      title: Center(child: MyText(text: "Detail Product", color: Colors.black)),
    );
  }

  _buildProductInformation() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(23), topLeft: Radius.circular(23))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            _buildProductNameAndPrice(widget.productName, widget.price),
            SizedBox(height: context.mediumValue),
            _buildProductDescription(),
            SizedBox(height: context.mediumValue),
            _buildOtherImageOfProductsList(),
          ],
        ),
      ),
    );
  }

  _buildProductNameAndPrice(productName, price) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        height: context.dynamicHeight(0.10),
        width: context.dynamicWidth(0.5),
        child: MyText(
          text: productName,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: context.dynamicHeight(0.10),
        width: context.dynamicWidth(0.3),
        child: MyCard(
            color: Colors.orange,
            child: Center(
              child: MyText(
                color: Colors.white,
                // ignore: unnecessary_brace_in_string_interps
                text: "\$${price}",
                fontWeight: FontWeight.w500,
              ),
            )),
      )
    ]);
  }

  MyText _buildProductDescription() {
    return MyText(
      text:
          "Luka's step track, shot is the muse for the NikeLuka'sxxx step track shot is the muse for the NikeLuka's step track, shot is  ",
      color: Colors.black38,
      fontSize: 15,
    );
  }

  Row _buildOtherImageOfProductsList() {
    //Buradada ListView.builder kullanamadım
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildOtherImage(),
        _buildOtherImage(),
        _buildOtherImage(),
        _buildOtherImage(),
      ],
    );
  }

  Expanded _buildOtherImage() {
    return Expanded(
        child: SizedBox(
      height: 100,
      width: 100,
      child: Image(
        image: widget.image,
      ),
    ));
  }

  _buildNavigationBar() {
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(
            height: context.dynamicHeight(0.1),
            width: context.dynamicWidth(0.3),
            child: MyCard(
              color: Color(0xFFf3f3f3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCardControlIcon(
                      onPressed: () {}, icon: Icon(Icons.remove_circle)),
                  MyText(text: "0"),
                  _buildCardControlIcon(
                      onPressed: () {}, icon: Icon(Icons.add_circle)),
                ],
              ),
            ),
          ),
          MyElevatedButton(
            onPressed: () {},
            text: "Add to Cart",
            buttonColor: CustomColorScheme.instance.appBlack,
            buttonWeight: 200,
          ),
        ],
      ),
    );
  }

  IconButton _buildCardControlIcon(
      {required Function onPressed, required Icon icon}) {
    return IconButton(
      iconSize: 30,
      color: Colors.black,
      onPressed: () {},
      icon: Icon(Icons.remove_circle),
    );
  }
}
