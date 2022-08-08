import 'package:flutter/material.dart';

import '../../components/card.dart';
import '../../components/navigation_bar.dart';
import '../../components/text.dart';
import '../../components/textfield_widget.dart';
import '../../extension/context_extension.dart';
import '../../theme/color_constants.dart';
import 'category/category_view.dart';
import 'product/products_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool? isFavorite;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        body: Padding(
          padding: context.paddingAllLow,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: context.mediumValue),
                _buildsearchBox(),
                SizedBox(height: context.mediumValue),
                _buildMainCard(),
                SizedBox(height: context.mediumValue),
                // ignore: prefer_const_constructors
                CategoryView(),
                SizedBox(height: context.mediumValue),
                // ignore: prefer_const_constructors
                ProductsView(),
              ],
            ),
          ),
        ),
        // ignore: prefer_const_constructors
        bottomNavigationBar: MyBottomNavBar(),
      ),
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
                  _buildMainCardColumn(text1: "Balance", text2: "\$280.65"),
                  _buildMainCardColumn(text1: "   VISA", text2: "...3028"),
                ]),
          )),
    );
  }

  Column _buildMainCardColumn({required String text1, required String text2}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        MyText(text: text1, color: Colors.white54),
        MyText(
          text: text2,
          color: Colors.white,
        ),
      ],
    );
  }
}
