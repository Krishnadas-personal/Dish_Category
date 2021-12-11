import '../models/meal.dart';
import 'package:flutter/material.dart';
import './main_drawer.dart';
import 'category_list.dart';
import 'favorites.dart';

class TabsScreens extends StatefulWidget {
  final List<Meal> favorite;
  const TabsScreens({Key key, this.favorite}) : super(key: key);

  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  List<Widget> pages;

  int _selectedIndexPage = 0;

  @override
  void initState() {
    pages = [
      CategoryListScreens(),
      FavoritesScreen(favoriteList: widget.favorite),
    ];

    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Meals"),
          ),
          drawer: DrawerScreen(),
          body: pages[_selectedIndexPage],
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectedPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedIndexPage,
            items: [
              BottomNavigationBarItem(
                  // ignore: deprecated_member_use
                  title: Text("Categories"),
                  icon: Icon(Icons.category)),
              BottomNavigationBarItem(
                  // ignore: deprecated_member_use
                  title: Text("Favorties"),
                  icon: Icon(Icons.star)),
            ],
          ),
        ));
  }
}
