import 'dart:io';

import 'package:flutter/material.dart';

class ProfileModify extends StatelessWidget {
  final File petImage;
 // final Function func;
  // final VoidCallback onClicked;

  const ProfileModify({
    Key? key,
    required this.petImage,
    //required this.func,
    // required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color =
        Theme.of(context).colorScheme.primary; // should comment this out ata
    return Center(
      child: Stack(
        // Overlap multiple widgets on top of each other
        children: [
          profileImage(),
          // Positioned(
          //   // Positions the edit icon
          //   bottom: 0,
          //   right: 4,
          //   child: editIcon(color),
          // ),
        ],
      ),
    );
  }

  profileImage() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
      ),
      child: Material(
        // must be implemented for ClipOval
        color: Colors.transparent,
        child: ClipOval(
          child: Image.file(
            // widget that shows an image obtained from an ImageProvider
            petImage,
            fit: BoxFit.cover,
            width: 170,
            height: 170,
            // child: InkWell(
            //   onTap: onClicked),       // splash effect when clicking
          ),
        ),
      ),
    );
  }

  // editIcon(Color color) => circleContainer(
  //       color: Colors.white,
  //       all: 3,
  //       child: circleContainer(
  //         color: firstColor,
  //         all: 8, // padding
  //         child: Icon(
  //           Icons.edit,
  //           color: Colors.white,
  //           size: 20,
  //         ),
  //       ),
  //     );
  //
  // circleContainer(
  //         {required Widget child, required double all, required Color color}) =>
  //     ClipOval(
  //       child: Container(
  //         child: child,
  //         color: firstColor,
  //         padding: EdgeInsets.all(all),
  //       ),
  //     );
}
