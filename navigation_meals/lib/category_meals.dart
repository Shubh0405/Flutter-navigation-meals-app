import 'package:flutter/material.dart';

class CategoryMeals extends StatelessWidget {
  // final String id;
  // final String title;

  // const CategoryMeals({super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final routeId = routeArgs['id'];
    final routeTitle = routeArgs['title'];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            routeTitle!,
            semanticsLabel: 'meals_appbar',
          ),
          leading: Semantics(
              label: 'back_button', container: true, child: BackButton()),
        ),
        body: Center(
          child: Text('Meals Recipe page!'),
        ));
  }
}
