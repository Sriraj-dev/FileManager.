import 'package:flutter/material.dart';
import 'package:manage_your_files/Scenes/configurations.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: menuColor,
    );
  }
}
