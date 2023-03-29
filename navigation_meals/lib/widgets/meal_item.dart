import 'package:flutter/material.dart';
import 'package:navigation_meals/widgets/meal_extra_info.dart';
import '../models/meals.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  const MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability,
      required this.removeItem});

  void clickMealItem(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/meal-details', arguments: id).then((value) {
      if (value != null) {
        removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => clickMealItem(context),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(imageUrl,
                        height: 250, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            Colors.black.withOpacity(0.01),
                            Colors.black
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      padding: EdgeInsets.symmetric(
                          vertical: 30.0, horizontal: 10.0),
                      width: double.infinity,
                      // height: 100,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  )
                ],
              ),
              MealExtraInfo(
                  duration: duration,
                  complexity: complexity,
                  affordability: affordability)
            ],
          ),
        ));
  }
}
