import 'dart:math';

import 'package:fap/components/CustomNavBar.dart';
import 'package:fap/services/breed_brain.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class BreedsPage extends StatefulWidget {

  @override
  _BreedsPageState createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {
  var breedData;

  List<Color> colors = [
    constants.firstColor,
    constants.secondColor,
    constants.thirdColor,
    constants.fourthColor
  ];

  List<Color> transparentColors = [
    constants.firstTransparentColor,
    constants.secondTransparentColor,
    constants.thirdTransparentColor,
    constants.fourthTransparentColor
  ];

  dynamic getData() async {
    BreedBrain breedBrain = BreedBrain();
    await breedBrain.generateBreedData();
    return breedData = breedBrain.getBreedData();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return FutureBuilder(
        future:
            getData(), // the function to get your data from firebase or firestore
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.data == null) {
            return Center(
              child: Text("LOADING", style: TextTitle),
            );
          } else {
            return generateScreenContent(screenWidth);
          }
        },
    );
  }

  generateScreenContent(double screenWidth) {
    final children = <Widget>[];

    children.add(
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Center(
          child: Text(
            'BREEDS',
            style: constants.TextTitle,
          ),
        ),
      ),
    );

    children.add(
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: screenWidth * 0.75,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search a specific breed",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    int colorIndex = 0;

    for (var i = 0; i < 172; i++) {
      children.add(
        BreedButton(
          breedName: breedData[i]['name'],
          color: transparentColors[colorIndex],
          iconColor: colors[colorIndex],
          picture: (Random().nextInt(10) + 1).toString() + "dog",
        ),
      );

      colorIndex++;
      if (colorIndex == 4)
        colorIndex = 0;
    }

    return ListView(
      children: children,
    );
  }
}

class BreedButton extends StatelessWidget {
  BreedButton(
      {required this.breedName,
      required this.color,
      required this.iconColor,
      required this.picture});

  final String breedName;
  final Color color;
  final Color iconColor;
  final String picture;

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
            child: Row(
              children: [
                DecoratedBox(
                  child: Container(
                    padding: const EdgeInsets.all(8.00),
                    width: 70,
                    height: 70,
                    child: Image.asset(
                      'icons/dog_icons/$picture.png',
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: iconColor,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        breedName,
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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