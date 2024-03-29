import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          children: DUMMY_CATEGORIES
              .map((category) => CategoryItem(
                  title: category.title,
                  color: category.color,
                  id: category.id))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1.5,
              mainAxisSpacing: 0.0,
              crossAxisSpacing: 0.0)),
    );
  }
}
