import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableComponent extends StatelessWidget {
  ReusableComponent(
      {required this.title,
      required this.color,
      required this.insideComponents,
      required this.function,
      required this.height,
      required this.index});
  final int index;
  final double height;
  final String title;
  final Color color;
  final Row insideComponents;
  final Function function;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: screenWidth * 0.80,
          height: height,
          child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: insideComponents,
            ),
            onPressed: () {
              function.call(context, index);
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
