import 'package:flutter/material.dart';

class EditProfileModify extends StatelessWidget {
  final String petImage;
  final VoidCallback onClicked;
  final bool isEdit;

  const EditProfileModify({
    Key? key,
    required this.petImage,
    required this.onClicked,
    this.isEdit = false,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          profileImage(),
          Positioned(
            // Positions the edit icon
            bottom: 0,
            right: 4,
            child: editIcon(color),
          ),
        ]
      ),
    );
  }

  profileImage() {
    final image = NetworkImage(petImage);
    return ClipOval(
      child: Material(
        // must be implemented for ClipOval
        color: Colors.transparent,
        child: Ink.image(
          // widget that shows an image obtained from an ImageProvider
          image: image,
          fit: BoxFit.cover,
          width: 170,
          height: 170,
          // child: InkWell(
          //   onTap: onClicked),       // splash effect when clicking
        ),
      ),
    );
  }

  editIcon(Color color) => circleContainer(
    color: Colors.white,
    all: 3,
    child: circleContainer(
      color: color,
      all: 8, // padding
      child: Icon(
        isEdit ? Icons.add_a_photo : Icons.edit,
        color: Colors.white,
        size: 20,
      ),
    ),
  );

  circleContainer(
      {required Widget child, required double all, required Color color}) =>
      ClipOval(
        child: Container(
          child: child,
          color: color,
          padding: EdgeInsets.all(all),
        ),
      );
}