import 'package:flutter/material.dart';
import '/widgets/main_drawer.dart';
import '/screens/categories_screen.dart';
import '/screens/favourites_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, Object>> _screenList = [
    {'screen': CategoriesScreen(), 'title': 'Categories'},
    {'screen': FavouriteScreen(), 'title': 'Favourites'}
  ];

  int _selectedPageIndex = 0;

  void _selectScreen(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenList[_selectedPageIndex]['title'] as String),
        centerTitle: true,
      ),
      body: _screenList[_selectedPageIndex]['screen'] as Widget,
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).canvasColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites')
        ],
      ),
    );
  }
}
