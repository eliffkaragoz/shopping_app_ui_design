import 'package:flutter/material.dart';
import 'package:ui_design_2/components/card.dart';
import 'package:ui_design_2/components/navigation_bar.dart';
import 'package:ui_design_2/components/text.dart';
import 'package:ui_design_2/components/textfield_widget.dart';
import 'package:ui_design_2/extension/context_extension.dart';
import 'package:ui_design_2/theme/color_constants.dart';
import 'package:ui_design_2/view/product_detail/product_detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: Padding(
        padding: context.paddingAllLow,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildsearchBox(),
              SizedBox(height: context.mediumValue),
              _buildMainCard(),
              SizedBox(height: context.mediumValue),
              _buildCategoryList(),
              SizedBox(height: context.mediumValue),
              _buildProductCardList()
            ],
          ),
        ),
      ),
      // ignore: prefer_const_constructors
      bottomNavigationBar: MyBottomNavBar(),
    );
  }

  MyTextFormField _buildsearchBox() {
    return const MyTextFormField(
        suffixIconColor: Colors.black,
        suffixIcon: Icons.search,
        hintText: "Search here...",
        fillColor: Colors.white);
  }

  SizedBox _buildMainCard() {
    return SizedBox(
      height: context.dynamicHeight(0.2),
      width: context.dynamicWidth(1),
      child: MyCard(
          color: CustomColorScheme.instance.appBlack,
          child: Padding(
            padding: context.paddingMedium,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMainCardTextValues(
                          text: "Balance", color: Colors.white54, size: 16),
                      _buildMainCardTextValues(text: "\$280.65"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildMainCardTextValues(text: "VISA"),
                      _buildMainCardTextValues(
                          text: "...3028", color: Colors.white54, size: 16),
                    ],
                  ),
                ]),
          )),
    );
  }

  MyText _buildMainCardTextValues(
      {required String text, Color color = Colors.white, double? size}) {
    return MyText(text: text, color: color, fontSize: size);
  }

  SingleChildScrollView _buildCategoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //Burdada ListView.builder içerisinde getirmeye çalıştım ama hata aldım

          _buildCategoryCard(icon: Icons.people, text: "Life Style"),
          _buildCategoryCard(icon: Icons.computer, text: "Electronic"),
          _buildCategoryCard(icon: Icons.featured_play_list, text: "Feature"),
          _buildCategoryCard(icon: Icons.kitchen_rounded, text: "Kitchen"),
          _buildCategoryCard(icon: Icons.featured_play_list, text: "Feature"),
          _buildCategoryCard(icon: Icons.kitchen_rounded, text: "Kitchen"),
          _buildCategoryCard(icon: Icons.featured_play_list, text: "Feature"),
          _buildCategoryCard(icon: Icons.kitchen_rounded, text: "Kitchen"),
        ],
      ),
    );
  }

  GestureDetector _buildCategoryCard(
      {required IconData icon, required String text}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => HomeView()),
        );
      },
      child: SizedBox(
        height: context.dynamicHeight(0.14),
        width: context.dynamicWidth(0.2),
        child: MyCard(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon),
            Text(text),
          ],
        )),
      ),
    );
  }

  SizedBox _buildProductCardList() {
    return SizedBox(
        height: context.dynamicHeight(0.5),
        width: context.dynamicWidth(1),
        child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(0.1),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,

                //Burada ListView.builder içerisinde yapmaya çalıştım ama çok hata aldım
                children: <Widget>[
                  _buildProductCard(
                      // ignore: prefer_const_constructors
                      image: AssetImage("assets/1.jpg"),
                      productName: "Jordon Zoom Seperate PF",
                      price: "133"),
                  _buildProductCard(
                      // ignore: prefer_const_constructors
                      image: AssetImage("assets/2.jpg"),
                      productName: "Jordon Zoom Seperate PF",
                      price: "1500"),
                  _buildProductCard(
                      // ignore: prefer_const_constructors
                      image: AssetImage("assets/1.jpg"),
                      productName: "Jordon Zoom Seperate PF",
                      price: "133"),
                  _buildProductCard(
                      // ignore: prefer_const_constructors
                      image: AssetImage("assets/2.jpg"),
                      productName: "Jordon Zoom Seperate PF",
                      price: "1500"),
                ],
              ),
            ),
          ],
        ));
  }

  GestureDetector _buildProductCard(
      {required AssetImage image,
      required String productName,
      required String price}) {
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
              _buildPriceInProductCard(price),
              Flexible(
                child: Image(image: image),
              ),
              _buildNameAndisFavoriteInProductCard(productName)
            ],
          ),
        )));
  }

  Align _buildPriceInProductCard(String price) {
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

  Row _buildNameAndisFavoriteInProductCard(String productName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: context.dynamicHeight(0.04),
          width: context.dynamicWidth(0.2),
          child: MyText(
            text: productName,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        // ignore: prefer_const_constructors
        IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
      ],
    );
  }
}
