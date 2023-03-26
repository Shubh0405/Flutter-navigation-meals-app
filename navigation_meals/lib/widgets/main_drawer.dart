import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget listTileBuilder(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'AlegreyaSans'),
      ),
      onTap: (() {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 40,
                  color: Theme.of(context).canvasColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listTileBuilder('Meals', Icons.restaurant),
          listTileBuilder('Settings', Icons.settings)
        ],
      ),
    );
  }
}
