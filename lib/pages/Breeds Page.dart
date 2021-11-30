import 'dart:math';
import 'package:fap/components/Button.dart';
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
    breedDuplicate.clear();
    breedDuplicate.addAll(breeds);
    return breedDuplicate;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(), // getting the breed data
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.data == null) {
          return Loading;
        } else {
          return ListBreed(
            breeds: breeds,
            breedDuplicate: breedDuplicate,
          );
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

    return SafeArea(
      child: generateScreenContent(screenWidth),
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
              controller: editingController,
              onChanged: (query) {
                filterSearchResults(query);
              },
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
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
    print(breedDuplicate.length.toString() + "WAKKKKKAHKKK");

    for (var i = 0; i < breedDuplicate.length; i++) {
      children.add(
        BreedButton(
          // breedName: breedData[i]['name'],
          breed: breedDuplicate[i],
          // color: transparentColors[colorIndex],
          color: Colors.transparent,
          iconColor: colors[colorIndex],
          // picture: breedDuplicate[i].imageURL,
        ),
      );

      colorIndex++;
      if (colorIndex == 4) colorIndex = 0;
    }

    return ListView(
      children: children,
    );
  }

  void filterSearchResults(String query) {
    List<Breed> dummySearchList = [];
    dummySearchList.addAll(breeds);

    if (query.isNotEmpty) {
      List<Breed> dummyData = [];
      dummySearchList.forEach((item) {
        if (item.name.toLowerCase().contains(query.toLowerCase())) {
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
  BreedButton({
    required this.breed,
    required this.color,
    required this.iconColor,
  });

  // final String breedName;
  final Breed breed;
  final Color color;
  final Color iconColor;
  // final String picture;

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
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => BreedInfoAlert(breed: breed),
            ),
            child: Row(
              children: [
                DecoratedBox(
                  child: Container(
                    padding: const EdgeInsets.all(3.00),
                    width: 70,
                    height: 70,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(breed.imageURL),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    color: Colors.white,
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
                        breed.name,
                        style: TextStyle(
                          fontSize: 23,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          breed.temperament,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                // shadowColor:
                //   MaterialStateProperty.all<Color>(Colors.),
                backgroundColor: MaterialStateProperty.all<Color>(iconColor),
                side: MaterialStateProperty.all(BorderSide(
                  width: 3,
                  color: iconColor,
                ))),
          ),
        ),
      ),
    );
  }
}

class BreedInfoAlert extends StatelessWidget {
  const BreedInfoAlert({required this.breed});

  final Breed breed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 10),
      backgroundColor: Colors.transparent,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              width: MediaQuery.of(context).size.width * 0.8,
              // color: constants.firstColor,
              child: Column(
                children: [
                  Text(
                    breed.name,
                    style: constants.TextContentHeading1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 0.5,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              constants.fifthColor,
                              Colors.black,
                              constants.fifthColor,
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Container(
                      // width: MediaQuery.of(context).size.width * 0.9,
                      // height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                            bottom: Radius.circular(25.0),
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(breed.imageURL),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BreedPopupDetail(
                    detailTitle: 'Life Span: ',
                    detailContent: breed.lifeSpan,
                  ),
                  Text(''),
                  BreedPopupDetail(
                    detailTitle: 'Weight: ',
                    detailContent: breed.weight + ' kg',
                  ),
                  Text(''),
                  BreedPopupDetail(
                    detailTitle: 'Height: ',
                    detailContent: breed.height + ' cm',
                  ),
                  Text(''),
                  BreedPopupDetail(
                    detailTitle: 'Temperament: ',
                    detailContent: breed.temperament,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button(
                        color: firstColor,
                        vPadding: 5,
                        hPadding: 5,
                        text: 'BACK',
                        onClicked: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: constants.fifthColor,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  width: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BreedPopupDetail extends StatelessWidget {
  const BreedPopupDetail({
    Key? key,
    required this.detailTitle,
    required this.detailContent,
  }) : super(key: key);

  final String detailTitle;
  final String detailContent;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: detailTitle,
                style: constants.TextContentHeading2,
              ),
              TextSpan(
                text: detailContent,
                style: constants.TextContentNormal,
              ),
            ]),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
