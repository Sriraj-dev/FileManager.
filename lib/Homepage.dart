
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:manage_your_files/Scenes/configurations.dart';
import 'package:manage_your_files/Scenes/openfolder.dart';
import 'package:manage_your_files/Services/SearchEngine.dart';
//import 'package:manage_your_files/widgets/File.dart';
import 'package:manage_your_files/widgets/NewfolderButton.dart';
import 'package:manage_your_files/widgets/folder.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController myController = new TextEditingController();
  double xoffset = 0;
  double yoffset = 0;
  double scalefactor = 1;
  bool isdraweropened = false;
  bool isListView = true;


  void viewSelection(int item){
    switch(item){
      case 0:
        setState(() {
          isListView = false;
        });

        break;
      case 1:
        setState(() {
          isListView = true;
        });
        break;
    }
  }

  void onSelected(BuildContext context, int item, int id, int index) {
    print("$id" + "in onSelected");
    switch (item) {
      case 0:
        break;

      case 1:
        createDialog(
            context, "Rename", "${folders[index].folderName}", "Rename", id);
        break;
      case 2:
        confirmDialog(context,id);
    }
  }

  void confirmDialog(BuildContext context ,int id) {
    print(id);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Do you really want to delete?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Image.asset("images/Warning.gif"),
            actions: [
              ElevatedButton(onPressed: (){Navigator.of(context).pop();}, child: Text("No")),
              ElevatedButton(onPressed: (){
                late int deleteAt;
                setState(() {
                  print("${folders.length} is the length");

                  for(int i=0;i<folders.length;i++){
                    print("Running $i time");
                    if(folders[i].id == id){
                      print("removing ${folders[i].id}");
                      //folders.removeAt(i);
                      deleteAt = i;
                    }
                     if(folders[i].id > id && i<folders.length){
                       print("$i in seconf if");
                      print("${folders[i].id} is being reduced");
                      folders[i].id = folders[i].id-1;
                    }
                  }
                  folders.removeAt(deleteAt);
                });
                Navigator.of(context).pop();
              }, child: Text("Yes")),
            ],

          );
        });
  }

  void changeDetails(String folderName, int id) {
    print("changing the details");
    setState(() {
      for (int i = 0; i < folders.length; i++) {
        if (folders[i].id == id) {
          folders[i].folderName = folderName;
        }
      }
      print(folders[0].folderName);
    });
  }

  void createDialog(BuildContext context, String title, String text,
      String buttontext, int index) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextStyle(color: Colors.black),
            ),

            //backgroundColor: Colors.grey,
            backgroundColor: Colors.white,

            content: TextField(
              cursorColor: Colors.grey,
              cursorHeight: 30,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0))),
              controller: myController..text = text,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                child: InkWell(
                  onTap: () {
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  radius: 100,
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: primaryVariant, fontSize: 16),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (buttontext == "Create") {
                        folders.add(Folder(
                          folderName: myController.text,
                          id: folders.length + 1,
                        ));
                      } else {
                        changeDetails(myController.text, index);
                      }
                    });
                    Navigator.of(context).pop();
                  },
                  radius: 100,
                  child: Text(
                    buttontext,
                    style: TextStyle(color: primaryVariant, fontSize: 16),
                  ),
                ),
              ),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isdraweropened = true) {
          setState(() {
            xoffset = 0;
            yoffset = 0;
            scalefactor = 1;
            isdraweropened = false;
          });
        }
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(

            //borderRadius: BorderRadius.circular(100),
            //shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                offset: Offset(0, 0),
                blurRadius: 10,
              )
            ]),
        duration: Duration(milliseconds: 300),
        transform: Matrix4.translationValues(xoffset, yoffset, 0)
          ..scale(scalefactor),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){
                showSearch(context: context, delegate: SearchEngine());
              }, icon: Icon(Icons.search_rounded)),
              PopupMenuButton<int>(
                onSelected: (item)=>viewSelection(item),
                  itemBuilder: (context){

                return [
                  PopupMenuItem<int>(
                    value: 0,
                      child: Row(
                        children: [
                          Icon(Icons.grid_4x4_rounded,color: Colors.black,),
                          SizedBox(width: 10,),
                          Text("Tileview"),
                        ],
                      ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.line_style_rounded,color: Colors.black,),
                        SizedBox(width: 10,),
                        Text("Listview"),
                      ],
                    ),
                  ),

                ];
              })
            ],
            title: Text("My Files"),
            leading: IconButton(
              icon: Icon(Icons.menu_rounded),
              onPressed: () {
                setState(() {
                  if (isdraweropened == false) {
                    xoffset = 200;
                    yoffset = 200;
                    scalefactor = 0.5;
                    isdraweropened = true;
                  } else if (isdraweropened) {
                    xoffset = 0;
                    yoffset = 0;
                    scalefactor = 1;
                    isdraweropened = false;
                  }
                });
              },
            ),
            backgroundColor: primaryColor,
          ),
          backgroundColor: backgroundColor,
          body: (isListView==false)?
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 20, 0, 0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 40,
                childAspectRatio: (150.0 / 200.0),
              ),
              itemCount: folders.length + 1,
              itemBuilder: (context, index) {
                if (index != folders.length) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () async {
                        await Navigator.push(context, MaterialPageRoute(builder: (context){
                           return FolderView(folderName: folders[index].folderName,id: folders[index].id,);
                         }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: folderColor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: folderShadow,
                                  blurRadius: 20,
                                  spreadRadius: 0),
                            ]),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Theme(
                                  data: Theme.of(context).copyWith(
                                      backgroundColor: Colors.black,
                                      cardColor: Colors.black),
                                  child: PopupMenuButton<int>(
                                      onSelected: (item) => onSelected(context,
                                          item, folders[index].id, index),
                                      itemBuilder: (context) {
                                        return [
                                          PopupMenuItem<int>(
                                              value: 0,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.folder_open_rounded,
                                                    color: menuTextColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Open",
                                                    style: TextStyle(
                                                        color: menuTextColor),
                                                  )
                                                ],
                                              )),
                                          PopupMenuItem(
                                              value: 1,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .drive_file_rename_outline_rounded,
                                                    color: menuTextColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Rename",
                                                    style: TextStyle(
                                                        color: menuTextColor),
                                                  )
                                                ],
                                              )),
                                          PopupMenuItem(
                                              value: 2,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.delete_rounded,
                                                    color: menuTextColor,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                        color: menuTextColor),
                                                  )
                                                ],
                                              )),
                                        ];
                                      }),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.folder_rounded,
                                  size: 100,
                                  color: Colors.white70,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${folders[index].folderName}",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white70),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (index == folders.length) {
                  return InkWell(
                      onTap: () {
                        print("tapped me!!");
                        createDialog(context, "Enter folder name", "New Folder",
                            "Create", -1);
                      },
                      child: NewFolderButton());
                } else
                  return InkWell(
                      onTap: () {
                        print("tapped me!!");
                        createDialog(context, "Enter folder name", "New folder",
                            "Create", -1);
                      },
                      child: NewFolderButton());
              },
            ),
          ):
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                height: 250,
                //margin: EdgeInsets.fromLTRB(0, 0, 0, 450),
                padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(10, 5,10, 0),

                    shrinkWrap: true,
                    itemCount: folders.length+1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      if(index != folders.length){
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () async{
                              await Navigator.push(context, MaterialPageRoute(builder: (context){
                                return FolderView(folderName: folders[index].folderName,id: folders[index].id,);
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: folderColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: folderShadow,
                                        blurRadius: 20,
                                        spreadRadius: 0),
                                  ]),
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                            backgroundColor: Colors.black,
                                            cardColor: Colors.black),
                                        child: PopupMenuButton<int>(
                                            onSelected: (item) => onSelected(context,
                                                item, folders[index].id, index),
                                            itemBuilder: (context) {
                                              return [
                                                PopupMenuItem<int>(
                                                    value: 0,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.folder_open_rounded,
                                                          color: menuTextColor,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "Open",
                                                          style: TextStyle(
                                                              color: menuTextColor),
                                                        )
                                                      ],
                                                    )),
                                                PopupMenuItem(
                                                    value: 1,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .drive_file_rename_outline_rounded,
                                                          color: menuTextColor,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "Rename",
                                                          style: TextStyle(
                                                              color: menuTextColor),
                                                        )
                                                      ],
                                                    )),
                                                PopupMenuItem(
                                                    value: 2,
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.delete_rounded,
                                                          color: menuTextColor,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "Delete",
                                                          style: TextStyle(
                                                              color: menuTextColor),
                                                        )
                                                      ],
                                                    )),
                                              ];
                                            }),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.folder_rounded,
                                        size: 100,
                                        color: Colors.white70,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${folders[index].folderName}",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white70),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }else{
                        return InkWell(
                            onTap: () {
                              print("tapped me!!");
                              createDialog(context, "Enter folder name", "New Folder",
                                  "Create", -1);
                            },
                            child: NewFolderButton());
                      }

                    }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 10,); },
                    ),
              ),
              Container(
                //color: Colors.white,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Divider(

                    height: 40,
                    thickness: 2,
                    color: primaryVariant,
                  ),
              ),
              // Row(
              //   children: [
              //     Text(" Recent ",style: TextStyle(
              //       fontSize: 16,
              //
              //     ),),
              //     Container(
              //       color: Colors.grey,
              //       height: 2,
              //       width: MediaQuery.of(context).size.width/1.3,
              //     )
              //   ],
              // )


            ],
          ),
        ),
      ),
    );
  }
}
