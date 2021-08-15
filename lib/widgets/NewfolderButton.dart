import 'package:flutter/material.dart';
import 'package:manage_your_files/Homepage.dart';
import 'package:manage_your_files/Scenes/configurations.dart';
import 'package:manage_your_files/widgets/folder.dart';

class NewFolderButton extends StatefulWidget {
  const NewFolderButton({Key? key}) : super(key: key);

  @override
  _NewFolderButtonState createState() => _NewFolderButtonState();
}

class _NewFolderButtonState extends State<NewFolderButton> {
  //TextEditingController myController = new TextEditingController();

  //
  // Future<void> createDialogue(BuildContext context){
  //   return showDialog(context: context, builder: (context){
  //     return AlertDialog(
  //       title: Text("Enter Folder name",style: TextStyle(color: Colors.black),),
  //
  //       //backgroundColor: Colors.grey,
  //       backgroundColor: dialogueBoxColor,
  //
  //
  //       content: TextField(
  //         cursorColor: Colors.white,
  //         cursorHeight: 30,
  //         style: TextStyle(color: Colors.black),
  //         decoration: InputDecoration(
  //           border: OutlineInputBorder(
  //             borderSide: const BorderSide(color: Colors.white,width: 2.0)
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderSide: const BorderSide(color: Colors.white,width: 2.0)
  //           )
  //         ),
  //
  //
  //         controller: myController..text = "New Folder",
  //       ),
  //       actions: [
  //
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(0,0,10,20),
  //           child: InkWell(
  //             onTap: (){Navigator.of(context).pop();},
  //             radius: 100,
  //             child: Text("Cancel",style: TextStyle(color: primaryVariant,fontSize: 16),),
  //           ),
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(0,0,10,20),
  //           child: InkWell(
  //             onTap: (){
  //
  //               folders.add(Folder( folderName: myController.text,));
  //               Navigator.of(context).pop();
  //             },
  //             radius: 100,
  //             child: Text("Create",style: TextStyle(color: primaryVariant,fontSize: 16),),
  //           ),
  //         ),
  //
  //       ],
  //
  //
  //     );
  //   });
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Container(


      width: MediaQuery.of(context).size.width*0.45,
      height: 100,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: newFolderButtonColor,
      ),
     child: Column(
       children: [
         SizedBox(height: 40,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Icon(Icons.add_rounded,size: 100,color: textColor,),
           ],

         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Text("Add Folder",style: TextStyle(color: textColor,fontSize: 16),),
           ],
         )

       ],
     ),

    );
  }
}
