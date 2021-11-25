import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableComponent extends StatelessWidget {
  ReusableComponent(
      {required this.title,
      required this.color,
      required this.iconColor,
      required this.insideComponents,
      required this.function});

  final String title;
  final Color color;
  final Color iconColor;
  final Row insideComponents;
  Function function = () {};

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          //color: Colors.blue,
          width: screenWidth * 0.80,
          height: 135,
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: insideComponents,
            ),
            onPressed: () {
              function.call(context);
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
              backgroundColor: MaterialStateProperty.all<Color>(color),
            ),
          ),
        ),
      ),
    );
  }
}
