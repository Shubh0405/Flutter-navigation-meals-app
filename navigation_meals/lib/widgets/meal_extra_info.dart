import 'package:flutter/material.dart';
import '../models/meals.dart';

class MealExtraInfo extends StatelessWidget {
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealExtraInfo(
      {super.key,
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
    return Padding(
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
    );
  }
}
