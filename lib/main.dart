import 'package:flutter/material.dart';
//import 'package:manage_your_files/openfolder.dart';

import 'Homepage.dart';
import 'package:manage_your_files/Scenes/menupage.dart';

void main() {
  runApp(MaterialApp(
    home : Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Menu(),
          Homepage(),
        ],

      ),
    );
  }
}

