import 'package:flutter/material.dart';
import '../screens/category_meals.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
      {super.key, required this.title, required this.color, required this.id});

  void clickCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/category-meal', arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => clickCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
          semanticsLabel: 'category_item',
        ),
      ),
    );
  }
}
