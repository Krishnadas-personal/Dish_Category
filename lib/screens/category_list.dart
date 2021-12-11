import '../widgets/category_item.dart';
import 'package:flutter/material.dart';
import '../category_data.dart';

class CategoryListScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GridView(
        padding: const EdgeInsets.all(12.0),
        children: CATEGORY_DATA.map((category) {
          return CategoryItemScreen(
              title: category.title, bgColor: category.color,id:category.id);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
     
    );
  }
}
