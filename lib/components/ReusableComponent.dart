import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableComponent extends StatelessWidget {
  ReusableComponent(
      {required this.title,
      required this.color,
      required this.insideComponents,
      required this.function,
      required this.height});

  final double height;
  final String title;
  final Color color;
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
          width: screenWidth * 0.80,
          height: height,
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
