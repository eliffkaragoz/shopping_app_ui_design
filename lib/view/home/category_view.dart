import 'package:flutter/material.dart';
import 'home_view.dart';
import '../../components/card.dart';
import '../../extension/context_extension.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);
  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List categoryList = [
    "Shoe",
    "Electronic",
    "Furniture",
    "Kitchen",
    "Cosmetic",
    "Cosmetic",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.14),
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList.length,
          itemBuilder: ((context, index) {
            return _buildCategoryCard(
                icon: Icons.people, text: categoryList[index]);
          })),
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
