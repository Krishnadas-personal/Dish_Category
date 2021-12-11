import 'package:dish_category/widgets/meals_item.dart';

import '../models/meal.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteList;
  const FavoritesScreen({Key key, this.favoriteList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (favoriteList.isEmpty)
        ? Center(
            child: Text(
              "No Favorites",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
            ),
          )
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Meals_screen(
                id: favoriteList[index].id,
                title: favoriteList[index].title,
                imageUrl: favoriteList[index].imageUrl,
                duration: favoriteList[index].duration,
                complexity: favoriteList[index].complexity,
                affordability: favoriteList[index].affordability,
              );
            },
            itemCount: favoriteList.length,
          );
  }
}
