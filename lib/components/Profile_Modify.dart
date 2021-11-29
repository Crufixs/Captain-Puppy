// import 'dart:io';
// import 'package:fap/model/User.dart';
// import 'package:fap/pages/Edit%20Profile.dart';
// import 'package:fap/utilities/constants.dart';
// import 'package:flutter/material.dart';
//
// class ProfileModify extends StatefulWidget {
//   // final String petImage;
//   // final VoidCallback onClicked;
//   //
//   // const ProfileModify({
//   //   Key? key,
//   //   // required this.petImage,
//   //   required this.onClicked,
//   // }) : super(key: key);
//
//   @override
//   State<ProfileModify> createState() => _ProfileModifyState();
// }
//
// class _ProfileModifyState extends State<ProfileModify> {
//   @override
//   Widget build(BuildContext context) {
//     final color =
//         Theme.of(context).colorScheme.primary; // should comment this out ata
//     return Center(
//       child: Stack(
//         // Overlap multiple widgets on top of each other
//         children: [
//           profileImage(),
//           Positioned(
//             // Positions the edit icon
//             bottom: 0,
//             left: 110,
//             child: ElevatedButton(
//               child: editIcon(color),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.transparent,
//                 shadowColor: Colors.transparent,
//               ),
//               onPressed: () => Navigator.of(context)
//                   .push(
//                     MaterialPageRoute(builder: (context) => EditProfile()),
//                   )
//                   .then((value) => setState(() {})),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   profileImage() {
//     final image = NetworkImage(User.pet.petImage);
//     return ClipOval(
//       child: Material(
//         // must be implemented for ClipOval
//         color: Colors.transparent,
//         child: Ink.image(
//           // widget that shows an image obtained from an ImageProvider
//           image: image,
//           fit: BoxFit.cover,
//           width: 170,
//           height: 170,
//           child: InkWell(
//               onTap: () => Navigator.of(context)
//                   .push(
//                     MaterialPageRoute(builder: (context) => EditProfile()),
//                   )
//                   .then((value) =>
//                       setState(() {}))), // splash effect when clicking
//         ),
//       ),
//     );
//   }
//
//   editIcon(Color color) => circleContainer(
//         color: Colors.white,
//         all: 3,
//         child: circleContainer(
//           color: firstColor,
//           all: 8, // padding
//           child: Icon(
//             Icons.edit,
//             color: Colors.white,
//             size: 20,
//           ),
//         ),
//       );
//
//   circleContainer(
//           {required Widget child, required double all, required Color color}) =>
//       ClipOval(
//         child: Container(
//           child: child,
//           color: color,
//           padding: EdgeInsets.all(all),
//         ),
//       );
// }
