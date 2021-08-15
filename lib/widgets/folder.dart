import 'package:flutter/material.dart';
import 'package:manage_your_files/Scenes/configurations.dart';

class Folder{
  String folderName;
  int id;

  Folder({required this.folderName,required this.id});
}
//
// class Folder extends StatefulWidget {
//   //const Folder({Key? key}) : super(key: key);
//   String folderName;
//   Folder({required this.folderName});
//
//   @override
//   _FolderState createState() => _FolderState(folderName);
// }
//
// class _FolderState extends State<Folder> {
//   String folderName;
//   _FolderState(this.folderName);
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(20),
//       child: InkWell(
//
//         onTap: (){},
//         child: Container(
//           decoration: BoxDecoration(
//             color: folderColor,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(color: folderShadow,blurRadius: 20,spreadRadius: 0),
//             ]
//           ),
//           height: 100,
//           width: MediaQuery.of(context).size.width*0.45,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_rounded),splashRadius: 20,)
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.folder_rounded,size: 100,color: textColor,),
//                   ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("$folderName",style: TextStyle(fontSize:16,color: textColor),)
//                   ],
//               )
//             ],
//           ),
//
//         ),
//       ),
//     );
//   }
// }
