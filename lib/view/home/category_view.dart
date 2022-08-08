import 'package:flutter/material.dart';
import 'package:ui_design_2/view/home/home_view.dart';
import '../../components/card.dart';
import '../../extension/context_extension.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
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
}
