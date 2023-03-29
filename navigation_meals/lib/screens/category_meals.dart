import 'package:flutter/material.dart';
import 'package:navigation_meals/dummy_data.dart';
import 'package:navigation_meals/widgets/meal_item.dart';
import '../models/meals.dart';

class CategoryMeals extends StatefulWidget {
  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String? routeTitle;
  List<Meal>? recipesList;
  var _initLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if (!_initLoading) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final routeId = routeArgs['id'];
      routeTitle = routeArgs['title']!;
      recipesList = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(routeId);
      }).toList();
      _initLoading = true;
    }

    super.didChangeDependencies();
  }

  void _removeItem(String mealId) {
    setState(() {
      recipesList?.removeWhere((meal) {
        return meal.id == mealId;
      });
    });
  }

  // final String id;
  @override
  Widget build(BuildContext context) {
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
              id: recipesList![index].id,
              title: recipesList![index].title,
              imageUrl: recipesList![index].imageUrl,
              duration: recipesList![index].duration,
              complexity: recipesList![index].complexity,
              affordability: recipesList![index].affordability,
              removeItem: _removeItem,
            );
          },
          itemCount: recipesList!.length,
        ));
  }
}
