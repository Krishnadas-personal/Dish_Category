import '../screens/meal_detail_screen.dart';

import '../models/meal.dart';
import 'package:flutter/material.dart';

class Meals_screen extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;


  const Meals_screen(
      {Key key,
      this.id,
      this.title,
      this.imageUrl,
      this.duration,
      this.affordability,
      this.complexity,
    })
      : super(key: key);

  void mealsDetail(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    ).then((result) {
    //  itemRemoval(result);
     print(result);
    });
  }

  String get affordableText {
    switch (affordability) {
      case Affordability.Cheap:
        return "Cheap";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Expensive";
        break;
      default:
        return "Unpredictable";
    }
  }

  String get confortableText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Difficult:
        return "Hard";
        break;
      default:
        return "Unpredictable";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => mealsDetail(context),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 5.0,
          margin: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0)),
                    child: Image.network(
                      imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 20,
                    child: Container(
                      color: Colors.black54,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timelapse_sharp),
                        SizedBox(width: 6),
                        Text('$duration'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text(confortableText),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text(affordableText),
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
