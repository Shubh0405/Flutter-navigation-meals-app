import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});

  String get complexityTest {
    switch (complexity) {
      case Complexity.Simple:
        // TODO: Handle this case.
        return "Simple";
        break;
      case Complexity.Challenging:
        // TODO: Handle this case.
        return "Challenging";
        break;
      case Complexity.Hard:
        // TODO: Handle this case.
        return "Hard";
        break;
      default:
        return "Unknown";
        break;
    }
  }

  String get affordabilityTest {
    switch (affordability) {
      case Affordability.Affordable:
        // TODO: Handle this case.
        return "Affordable";
        break;
      case Affordability.Pricey:
        // TODO: Handle this case.
        return "Pricey";
        break;
      case Affordability.Luxurious:
        // TODO: Handle this case.
        return "Luxurious";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (() {}),
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(
                          width: 6,
                        ),
                        Text('$duration mins')
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 6,
                        ),
                        Text(complexityTest)
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityTest)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
