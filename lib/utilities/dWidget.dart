import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Home Page'),
      leading: GestureDetector(
        onTap: () {
          Scaffold.of(context).openDrawer();
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.person), // Replace custom_icon with your own icon
        ),
      ),
    );
  }
}