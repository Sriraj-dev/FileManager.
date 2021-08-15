import 'package:flutter/material.dart';
import 'package:manage_your_files/Scenes/configurations.dart';

class FolderView extends StatefulWidget {
  //const FolderView({Key? key}) : super(key: key);
  String folderName;
  int id;
  FolderView({required this.folderName,required this.id});
  @override
  _FolderViewState createState() => _FolderViewState(folderName,id);
}

class _FolderViewState extends State<FolderView> {
  String folderName;
  int id;
  _FolderViewState(this.folderName,this.id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(folderName),
        backgroundColor: primaryColor,

      ),
      backgroundColor: backgroundColor,
    );
  }
}
