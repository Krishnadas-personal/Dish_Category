import 'package:dish_category/category_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'meals_details';
final Function toogleFunction;
final Function isFav;

  const MealDetailScreen({Key key, this.toogleFunction, this.isFav}) : super(key: key);


  Widget buildSelectedTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildContainerList(Widget child) {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.black38,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 140,
      width: 350,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSelectedTitle(context, 'Ingredients'),
            buildContainerList(
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSelectedTitle(context, 'Steps'),
            buildContainerList(ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${(index + 1)}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(
                    thickness: 2.0,
                    color: Colors.grey,
                  )
                ]);
              },
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isFav(mealId) ? Icon(Icons.star_rounded):Icon(Icons.star_border_sharp),
        onPressed: () {
         toogleFunction(mealId);
        },
      ),
    );
  }
}
