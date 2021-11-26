import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final double vPadding;
  final double hPadding;

  const Button({
    Key? key,
    required this.text,
    required this.onClicked,
    required this.vPadding,
    required this.hPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: vPadding,
          horizontal: hPadding,
        ),
        shape: StadiumBorder(),
        onPrimary: Colors.white,
        primary: firstColor,
      ),
      child: Text(text,
          style: TextStyle(
            fontSize: 18,
          )),
      onPressed: onClicked,
    );
  }
}
