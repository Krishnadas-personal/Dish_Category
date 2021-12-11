import 'package:flutter/material.dart';

import '../screens/category_dishes.dart';

class CategoryItemScreen extends StatelessWidget {
  final String id;
  final String title;
  final Color bgColor;

  const CategoryItemScreen({Key key, this.title, this.bgColor, this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed( DishesForCategoryScreen.categoryDishes, arguments: {
          "id": id,
          "title": title,
        });
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: Text(title),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  bgColor.withOpacity(0.5),
                  bgColor,
                ])),
      ),
    );
  }
}
