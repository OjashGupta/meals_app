import 'package:flutter/material.dart';
import '../models/meal.dart';
import '/widgets/main_drawer.dart';
import '../Screens/categories_screen.dart';
import './favourite_screen.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouriteScreen(widget.favoriteMeals), 'title': 'Favorites'},
  ];
    super.initState();
  }
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Color.fromARGB(255, 230, 196, 95),
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(
              Icons.category,
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          )
        ],
      ),
    );
  }
}
