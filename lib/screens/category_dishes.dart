import 'package:dish_category/models/meal.dart';
import 'package:flutter/material.dart';
import '../widgets/meals_item.dart';

class DishesForCategoryScreen extends StatefulWidget {
  final String id;
  final String category;
  final List availableMeals;

  const DishesForCategoryScreen(
      {Key key, this.category, this.id, this.availableMeals})
      : super(key: key);
  static const categoryDishes = '/categories';

  @override
  _DishesForCategoryScreenState createState() =>
      _DishesForCategoryScreenState();
}

class _DishesForCategoryScreenState extends State<DishesForCategoryScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  var _initstateCheck = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_initstateCheck) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      categoryMeals = widget.availableMeals.where((cat_meals) {
        return cat_meals.categories.contains(categoryId);
      }).toList();
      _initstateCheck = true;
    }
    super.didChangeDependencies();
  }

  void _itemRemove(String meal) {
    setState(() {
      categoryMeals.removeWhere((meals) => meals.id == meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: (categoryMeals.isEmpty)
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("There is no meals according to the settings",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 24,
                      )),
                ),
              )
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Meals_screen(
                    id: categoryMeals[index].id,
                    title: categoryMeals[index].title,
                    imageUrl: categoryMeals[index].imageUrl,
                    duration: categoryMeals[index].duration,
                    complexity: categoryMeals[index].complexity,
                    affordability: categoryMeals[index].affordability,
                  );
                },
                itemCount: categoryMeals.length,
              ));
  }
}
