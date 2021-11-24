import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableComponent extends StatelessWidget {
  ReusableComponent(
      {required this.breedName,
      required this.color,
      required this.iconColor,
      required this.insideComponents});

  final String breedName;
  final Color color;
  final Color iconColor;
  final Row insideComponents;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: screenWidth * 0.80,
          height: screenHeight * 0.15,
          child: ElevatedButton(
            child: insideComponents,
            onPressed: () {},
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
