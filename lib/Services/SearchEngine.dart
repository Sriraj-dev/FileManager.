import 'package:flutter/material.dart';
import 'package:manage_your_files/Scenes/configurations.dart';
import 'package:manage_your_files/Scenes/openfolder.dart';
import 'package:manage_your_files/widgets/File.dart';
import 'package:manage_your_files/widgets/folder.dart';

class SearchEngine extends SearchDelegate<String> {
  List<String> folderSearchItems = [

    //  "First folder",
    // "Second Folder",
    // "Third Folder",
    folders.map((Folder f) {
      return f.folderName;
    }).toString(),
  ];
  List<String> fileSearchItems = [
    files.map((File f) {
      return f.fileName;
    }).toString(),
  ];
  List<String> fileRecentSearches = [
    files.map((File f) {
      return f.fileName;
    }).toString(),
  ];
  List<String> folderRecentSearches = new List<String>.generate(folders.length, (i){
      return folders[i].folderName;
    });



  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions in appbar
    return [
      IconButton(onPressed: (){}, icon: Icon(Icons.clear_rounded))
    ];
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, "null");
    }, icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
    ));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // implement when clicked.
    return Column();
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //show suggestions.
    List<String> folderSuggestions =
        query.isEmpty ? folderRecentSearches : folderSearchItems.where((t) => t.startsWith(query)).toList();

    return ListView.builder(

      itemCount: folderSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: RichText(text: TextSpan(
              text: folderSuggestions[index].substring(0,query.length),

              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children:[
                TextSpan(
                  text: folderSuggestions[index].substring(query.length),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal
                  )
                ),
              ]
          ),

          ),
          leading: Icon(Icons.folder),
        );
      },
    );
    throw UnimplementedError();
  }
}
