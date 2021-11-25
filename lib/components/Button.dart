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
          vertical: 12,
          horizontal: 20,
        ),
        shape: StadiumBorder(),
        onPrimary: Colors.white,
      ),
      child: Text(text,
          style: TextStyle(
            fontSize: 15,
          )),
      onPressed: onClicked,
    );
  }
}
