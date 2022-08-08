// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:ui_design_2/components/buttons/elevated_button_widget.dart';
import 'package:ui_design_2/components/card.dart';
import 'package:ui_design_2/components/text.dart';
import 'package:ui_design_2/extension/context_extension.dart';
import 'package:ui_design_2/theme/color_constants.dart';

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
  bool isFavorite = true;
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
          _buildProductInformationBox(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                isFavorite == true ? isFavorite = false : isFavorite = true;
                print(isFavorite);
              });
            },
            icon: isFavorite == true
                ? Icon(Icons.favorite_border)
                : Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ))
      ],
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: CustomColorScheme.instance.appWhite,
      centerTitle: true,
      title: Center(child: MyText(text: "Detail Product", color: Colors.black)),
    );
  }

//Ayrı bir class'a taşısam abartmış olur muyum?
  SingleChildScrollView _buildProductInformationBox() {
    return SingleChildScrollView(
      child: Padding(
        padding: context.paddingAllLow,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(1), topLeft: Radius.circular(1))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(height: context.mediumValue),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductNameText(),
                  _buildProductPriceCard(),
                ],
              ),
              SizedBox(height: context.mediumValue),
              _buildProductDescription(),
              SizedBox(height: context.mediumValue),
              _buildOtherImageOfProduct(),
              _buildCartInformation()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildProductPriceCard() {
    return SizedBox(
      height: context.dynamicHeight(0.08),
      width: context.dynamicWidth(0.3),
      child: MyCard(
          color: Colors.orange,
          child: Center(
            child: MyText(
              color: Colors.white,
              // ignore: unnecessary_brace_in_string_interps
              text: "\$${widget.price}",
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }

  SizedBox _buildProductNameText() {
    return SizedBox(
      height: context.dynamicHeight(0.08),
      width: context.dynamicWidth(0.5),
      child: MyText(
        text: widget.productName,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  MyText _buildProductDescription() {
    return MyText(
      text:
          "Luka's step track, shot is the muse for the NikeLuka'sxxx step track shot is the muse for the NikeLuka's step track, shot is  ",
      color: Colors.black38,
      fontSize: 15,
    );
  }

  Row _buildOtherImageOfProduct() {
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

  Container _buildCartInformation() {
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
      {required VoidCallback? onPressed, required Icon icon}) {
    return IconButton(
      iconSize: 30,
      color: Colors.black,
      onPressed: onPressed,
      icon: icon,
    );
  }
}
