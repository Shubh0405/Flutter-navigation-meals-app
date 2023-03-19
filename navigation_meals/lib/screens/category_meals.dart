import 'package:flutter/material.dart';
import 'package:navigation_meals/dummy_data.dart';
import 'package:navigation_meals/widgets/meal_item.dart';
import '../models/meals.dart';

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
    final List<Meal> recipesList = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(routeId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            routeTitle!,
            semanticsLabel: 'meals_appbar',
          ),
          leading: Semantics(
              label: 'back_button', container: true, child: BackButton()),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: recipesList[index].id,
                title: recipesList[index].title,
                imageUrl: recipesList[index].imageUrl,
                duration: recipesList[index].duration,
                complexity: recipesList[index].complexity,
                affordability: recipesList[index].affordability);
          },
          itemCount: recipesList.length,
        ));
  }
}
