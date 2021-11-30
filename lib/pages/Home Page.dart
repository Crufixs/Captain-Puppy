import 'dart:convert';
import 'package:fap/components/package/change_theme_button_widget.dart';
import 'package:fap/main.dart';
import 'package:fap/model/Pet.dart';
import 'package:fap/model/User.dart';
import 'package:fap/providers/theme_provide.dart';
import 'package:fap/utilities/constants.dart' as constants;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BabyPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final GlobalKey<ChangeThemeButtonWidgetState> changeButtonKey = GlobalKey();

  refresh() {
    setState(() {
      print('reload page');
    });
  }

  dynamic loadData() async {
    return User.userName;
  }

  IconData icon = CupertinoIcons.moon_stars;

  @override
  Widget build(BuildContext context) {
    final text = MediaQuery
        .of(context)
        .platformBrightness == Brightness.dark
        ? 'DarkTheme'
        : 'LightTheme';
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

    return FutureBuilder(
        future: loadData(), // getting the user data
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.data == null) {
            return Scaffold();
          } else {
            return Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    //EXPANDED 1
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Message & Profile Pic
                      Container(
                        width: screenWidth * 0.9,
                        // height: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hi, ' + User.userName.toString() + "!",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                      'Your dog misses you today!',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'images/FluffyPuppy.png',
                                      // width:110,
                                      height: 110,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      //Icons
                      Container(
                        width: screenWidth * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.pets,
                                  color: Color(0xff7d79f2),
                                  size: 40,
                                ),
                                Text(
                                  User.pet.breed.toString(),
                                  style: TextStyle(
                                    color: Color(0xff7d79f2),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  'images/gender.png',
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  User.pet.gender.toString(),
                                  style: TextStyle(
                                    color: Color(0xff7D79F2),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.cake,
                                  color: Color(0xff7d79f2),
                                  size: 40,
                                ),
                                Text(
                                  User.pet.age.toString() + 'y/o',
                                  style: TextStyle(
                                    color: Color(0xff7d79f2),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  "images/weight.png",
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  User.pet.weight.toString() + ' kg',
                                  style: TextStyle(
                                    color: Color(0xff7d79f2),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      //Buttons
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth * 0.4,
                                height: screenWidth * 0.47,
                                child: ElevatedButton(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "images/profileIcon.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Profile',
                                        style: TextStyle(
                                          color: Color(0xffF2F2F2),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        constants.fourthColor),
                                  ),
                                  onPressed: () {
                                    changePage(context, 2);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: screenWidth * 0.4,
                                height: screenWidth * 0.47,
                                child: ElevatedButton(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "images/noteIcon.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Notes',
                                        style: TextStyle(
                                          color: Color(0xffF2F2F2),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        constants.secondColor),
                                  ),
                                  onPressed: () {
                                    changePage(context, 4);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: screenWidth * 0.4,
                                height: screenWidth * 0.47,
                                child: ElevatedButton(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.pets,
                                        color: Color(0xffF2F2F2),
                                        size: 80,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Breeds',
                                        style: TextStyle(
                                          color: Color(0xffF2F2F2),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        constants.firstColor),
                                  ),
                                  onPressed: () {
                                    changePage(context, 3);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: screenWidth * 0.4,
                                height: screenWidth * 0.47,
                                child: ElevatedButton(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "images/expensesIcon.png",
                                        height: 80,
                                        width: 80,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Expenses',
                                        style: TextStyle(
                                          color: Color(0xffF2F2F2),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        constants.thirdColor),
                                  ),
                                  onPressed: () {
                                    changePage(context, 1);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      //Help
                      Container(
                        // height: screenHeight * 0.1,
                        width: screenWidth * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                            Column(
                            children: [
                            Column(
                            children: [
                                // Icon(CupertinoIcons.moon_stars,
                                //     size: 30,
                                //    color: Color(0xff7D79F2),
                                // ),
                                //ChangeThemeButtonWidget(key: changeButtonKey, function: refresh),
                                IconButton(
                                icon: Icon(icon),
                            iconSize: 30,
                            color: Color(0xff7D79F2),
                            onPressed: () {
                              User.isDarkMode = !User.isDarkMode!;
                              final provider = Provider.of<ThemeProvider>(
                                  context, listen: false);
                              provider.toggleTheme(User.isDarkMode!);

                              setState(() {
                                if (User.isDarkMode!) {
                                  icon = CupertinoIcons.sun_max;
                                  print('sun');
                                } else {
                                  icon = CupertinoIcons.moon_stars;
                                  print('moon');
                                }
                                print(User.isDarkMode!);
                              });
                            },
                          ),
                          ],
                        ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      "images/qmarkFinal.png",
                                      height: 30.0,
                                      width: 30.0,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shadowColor:
                              MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )],
          ),
          ),
          ),
          );
          }
        });
  }

  void changePage(BuildContext context, int pageNo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BabyPage(selectedPage: pageNo),
      ),
    );
  }
}
