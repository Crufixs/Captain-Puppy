import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const Button({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 50,
        ),
        shape: StadiumBorder(),
        primary: firstColor,
        onPrimary: Colors.white,
      ),
      child: Text(text,
          style: TextStyle(
            fontSize: 18,
          )),
      onPressed: onClicked,
    );
  }
}
