import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("FoodApp"),
          accountEmail: Text("foodapp@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              'A',
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        _createDrawerItem(
          icon: Icons.home,
          text: 'Home',
        ),
        _createDrawerItem(
          icon: Icons.shopping_basket,
          text: 'Receive Cart',
        ),
        _createDrawerItem(
          icon: Icons.person_outline,
          text: 'My Profile',
        ),
        Divider(),
        _createDrawerItem(
            icon: Icons.notifications_none, text: 'Notofications'),
        _createDrawerItem(icon: Icons.star_border, text: 'Rating & Review'),
        _createDrawerItem(icon: Icons.favorite_border, text: 'WishList'),
        _createDrawerItem(icon: Icons.filter_none, text: 'Rules & Complaint'),
        Divider(),
        ListTile(
          title: Text('0.0.1'),
          onTap: () {},
        ),
      ],
    ));
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
