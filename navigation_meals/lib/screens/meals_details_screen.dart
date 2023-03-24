import 'package:flutter/material.dart';
import 'package:navigation_meals/dummy_data.dart';
import 'package:navigation_meals/widgets/meal_extra_info.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context)?.settings.arguments as String;

    final mealData = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(mealData.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(mealData.imageUrl,
                    height: 250, width: double.infinity, fit: BoxFit.cover),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Ingredients',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runSpacing: 15,
                  children: mealData.ingredients
                      .map((ingredient) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Theme.of(context).primaryColor),
                            padding: EdgeInsets.all(8.0),
                            margin: EdgeInsets.only(right: 8.0),
                            child: Text(
                              ingredient,
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Steps',
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Column(
                children: mealData.steps.map((e) {
              int id = mealData.steps.indexOf(e);
              return Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: Text(
                    '${id + 1}. $e',
                    style: TextStyle(fontSize: 15),
                  ));
            }).toList()),
            MealExtraInfo(
                duration: mealData.duration,
                complexity: mealData.complexity,
                affordability: mealData.affordability)
          ],
        ),
      ),
    );
  }
}
