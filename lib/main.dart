import 'package:dish_category/category_data.dart';

import './screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';
import './models/meal.dart';
import './screens/category_dishes.dart';
import './screens/filter_screen.dart';
import './category_data.dart';

import './screens/tab_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  void _filterMeals(Map<String, bool> filterSaved) {
    setState(() {
      _filters = filterSaved;
      _availableMeals = DUMMY_MEALS.where((meals) {
        if (_filters['gluten'] && !meals.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meals.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meals.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meals.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toogleFavorite(String mealid) {
    final existingIndex = _favMeals.indexWhere((meals) {
      return meals.id == mealid;
    });
    if (existingIndex >= 0) {
      setState(() {
        _favMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
      });
    }
  }

  bool isFavorite(mealid) {
 
     return  _favMeals.any((meal) => meal.id == mealid);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple, accentColor: Colors.amber),
      // home: TabsScreens(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsScreens(favorite: _favMeals),
        DishesForCategoryScreen.categoryDishes: (context) =>
            DishesForCategoryScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(toogleFunction: toogleFavorite,isFav:isFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(currentSettings: _filters, filterMeals: _filterMeals),
      },
    );
  }
}
