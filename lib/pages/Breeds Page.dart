import 'dart:math';
import 'package:fap/model/breed.dart';
import 'package:fap/services/breed_brain.dart';
import 'package:fap/services/database_services.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:fap/utilities/constants.dart';
import 'package:flutter/material.dart';

class BreedsPage extends StatefulWidget {
  @override
  _BreedsPageState createState() => _BreedsPageState();
}

class _BreedsPageState extends State<BreedsPage> {

  List<Breed> breeds = [];
  List<Breed> breedDuplicate = [];

  dynamic getData() async {
    BreedBrain breedBrain = BreedBrain();
    await breedBrain.generateBreedData();
    breeds = breedBrain.getBreedList();
    breedDuplicate.addAll(breeds);
    return breedDuplicate;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(), // getting the breed data
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.data == null) {
          return Center(
            child: Text("LOADING", style: TextTitle),
          );
        } else {
          return ListBreed(breeds: breeds, breedDuplicate: breedDuplicate,);
        }
      },
    );
  }
}


class ListBreed extends StatefulWidget {
  ListBreed({required this.breeds, required this.breedDuplicate});

  final List<Breed> breeds;
  final List<Breed> breedDuplicate;

  @override
  _ListBreedState createState() => _ListBreedState();
}

class _ListBreedState extends State<ListBreed> {

  List<Breed> breeds = [];
  List<Breed> breedDuplicate = [];

  TextEditingController editingController = TextEditingController();

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

  @override
  void initState() {
    // TODO: implement initState
    breeds = widget.breeds;
    breedDuplicate = widget.breedDuplicate;
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return generateScreenContent(screenWidth);
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
              controller: editingController,
              onChanged: (query){
                filterSearchResults(query);
              },
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
    print(breedDuplicate.length);

    for (var i = 0; i < breedDuplicate.length; i++) {
      children.add(
        BreedButton(
          // breedName: breedData[i]['name'],
          breedName: breedDuplicate[i].name,
          color: transparentColors[colorIndex],
          iconColor: colors[colorIndex],
          picture: breedDuplicate[i].imageURL,
        ),
      );

      colorIndex++;
      if (colorIndex == 4) colorIndex = 0;
    }

    return ListView(
      children: children,
    );
  }

  void filterSearchResults(String query){
    List<Breed> dummySearchList = [];
    dummySearchList.addAll(breeds);

    if(query.isNotEmpty) {
      List<Breed> dummyData = [];
      dummySearchList.forEach((item) {
        if(item.name.toLowerCase().contains(query.toLowerCase())) {
          dummyData.add(item);
        }
      });
      setState(() {
        breedDuplicate.clear();
        breedDuplicate.addAll(dummyData);
      });
      return;
    } else {
      setState(() {
        breedDuplicate.clear();
        breedDuplicate.addAll(breeds);
      });
    }
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
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(picture),
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
                            color: constants.fifthColor,
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
