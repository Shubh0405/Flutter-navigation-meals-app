import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget listTileBuilder(String title, IconData icon, VoidCallback tileClick) {
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
      onTap: tileClick,
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
          listTileBuilder('Profile', Icons.account_circle_outlined, () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/profile');
          }),
          listTileBuilder('Filters', Icons.settings, () {
            Navigator.pop(context);
            Navigator.of(context).pushNamed('/filters');
          })
        ],
      ),
    );
  }
}
