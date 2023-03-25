import 'package:flutter/material.dart';
import 'screens/tab_screen.dart';
import 'screens/meals_details_screen.dart';
import 'screens/category_meals.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Meals App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.pink,
          canvasColor: Color.fromRGBO(225, 224, 229, 1),
          fontFamily: 'VarelaRound',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              titleSmall: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'AlegreyaSans',
                  fontWeight: FontWeight.bold))),
      // home: const CategoriesScreen(),
      routes: {
        '/': (context) => TabScreen(),
        '/category-meal': (context) => CategoryMeals(),
        '/meal-details': (context) => MealDetailsScreen()
      },
    );
  }
}
