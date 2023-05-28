// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../utility.dart';

// class NewContribution extends StatelessWidget {
//   const NewContribution({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         toolbarHeight: 0,
//         backgroundColor: Colors.blue, // Status bar color
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: getheight(context, 30)),
//           Container(
//               margin: EdgeInsets.symmetric(horizontal: getwidth(context, 40)),
//               child: Column(
//                 children: [
//                   Text(
//                     "New Contribution",
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: getheight(context, 40),
//                   ),
//                   TextField(
//                     onChanged: (value) {
//                       // setState(() {
//                       //   _email = value.replaceAll(" ", "");
//                       // });
//                     },
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Enter Title",
//                         hintStyle: TextStyle(
//                             fontSize: 16, color: Colors.grey.withOpacity(0.5))),
//                   ),
//                   Divider(height: 2, thickness: 3)
//                 ],
//               )),
//           /////////// ADD TAGS
//           SizedBox(height: getheight(context, 115)),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             width: getwidth(context, 190),
//             decoration: BoxDecoration(
//               color: Color(0xFF0D253C),
//               borderRadius: BorderRadius.circular(60),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 6,
//                   blurRadius: 8,
//                   offset: Offset(0, 4),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.link,
//                   color: Colors.white,
//                 ),
//                 SizedBox(
//                   width: getwidth(context, 8),
//                 ),
//                 Text(
//                   "Upload File",
//                   style: TextStyle(color: Colors.white),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: getheight(context, 40),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             width: getwidth(context, 190),
//             decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 6,
//                     blurRadius: 8,
//                     offset: Offset(0, 4),
//                   ),
//                 ],
//                 color: Color(0xFF0D253C),
//                 borderRadius: BorderRadius.circular(60)),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(
//                   Icons.image,
//                   color: Colors.white,
//                 ),
//                 SizedBox(
//                   width: getwidth(context, 8),
//                 ),
//                 Text(
//                   "Upload Image",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           GestureDetector(
//             onTap: () {
//               ////////// SUBMIT
//             },
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: 14),
//               width: getwidth(context, 212),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(60), color: blueColor),
//               child: const Center(
//                 child: Text(
//                   "PUBLISH",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: getheight(context, 35),
//           )
//         ],
//       ),
//     );
//   }
// }
