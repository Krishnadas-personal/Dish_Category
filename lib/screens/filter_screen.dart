import './main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filterScreen';

  final Function filterMeals;
  final Map<String,bool> currentSettings;

  const FiltersScreen({Key key, this.filterMeals,this.currentSettings}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;



  Widget _buildSwitchListTile(String title, String description,
      bool currentvalue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentvalue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
    void initState() {
    _glutenfree=widget.currentSettings['gluten'];
    _lactoseFree=widget.currentSettings['lactose'];
    _vegan=widget.currentSettings['vegan'];
    _vegetarian=widget.currentSettings['vegetarian'];
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          InkWell(
            onTap: () {
             final Map<String, bool> _filterMeals = {
                "gluten": _glutenfree,
                "lactose": _lactoseFree,
                "vegan": _vegan,
                "vegetarian": _vegetarian
              };
              widget.filterMeals(_filterMeals);
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.save),
            ),
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust the meals",
                style: Theme.of(context).textTheme.headline6,
              )),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile("Gluten-Free",
                    "Only includes Gluten-Free meals", _glutenfree, (newValue) {
                  setState(() {
                    _glutenfree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Luctose-Free",
                    "Only includes Luctose-Free meals",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegan-Free", "Only includes Vegan-Free meals", _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchListTile(
                    "Vegetarian-Free",
                    "Only includes Vegetarian-Free meals",
                    _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
