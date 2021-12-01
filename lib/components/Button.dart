import 'package:fap/model/User.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;
  final double vPadding;
  final double hPadding;
  final Color color;

  const Button(
      {Key? key,
      required this.text,
      required this.onClicked,
      required this.vPadding,
      required this.hPadding,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: vPadding,
          horizontal: hPadding,
        ),
        shape: StadiumBorder(),
        primary: color,
        onPrimary: Colors.white,
      ),
      child: Text(text,
          style: TextStyle(
            color: !User.isDarkMode! ? Colors.black : Colors.white,
            fontSize: 18,
          )),
      onPressed: onClicked,
    );
  }
}
